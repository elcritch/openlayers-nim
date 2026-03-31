#!/usr/bin/env node

import fs from 'node:fs';
import https from 'node:https';
import path from 'node:path';

const repoRoot = process.cwd();
const olRoot = path.join(repoRoot, 'node_modules', 'ol');
const outWrapRoot = path.join(repoRoot, 'src', 'openlayers');
const outApiFile = path.join(repoRoot, 'generated', 'openlayers-api.json');
const apidocNavUrl = 'https://openlayers.org/en/latest/apidoc/navigation.tmpl.html';
const manualPublicModules = new Set([
  'control',
  'interaction',
  'layer',
  'format',
  'geom',
  'style'
]);

if (!fs.existsSync(olRoot)) {
  console.error(`Missing OpenLayers typings root: ${olRoot}`);
  process.exit(1);
}

const nimKeywords = new Set([
  'addr', 'and', 'as', 'asm', 'bind', 'block', 'break', 'case', 'cast', 'concept',
  'const', 'continue', 'converter', 'defer', 'discard', 'distinct', 'div', 'do', 'elif',
  'else', 'end', 'enum', 'except', 'export', 'finally', 'for', 'from', 'func', 'if',
  'import', 'in', 'include', 'interface', 'is', 'isnot', 'iterator', 'let', 'macro',
  'method', 'mixin', 'mod', 'nil', 'not', 'notin', 'object', 'of', 'or', 'out', 'proc',
  'ptr', 'raise', 'ref', 'return', 'shl', 'shr', 'static', 'template', 'try', 'tuple',
  'type', 'using', 'var', 'when', 'while', 'xor', 'yield'
]);

function stripComments(text) {
  let t = text.replace(/\/\*[\s\S]*?\*\//g, '');
  t = t.replace(/(^|[^:])\/\/.*$/gm, '$1');
  return t;
}

function toLowerCamel(str) {
  if (!str) return str;
  if (/^[A-Z0-9_]+$/.test(str)) return str.toLowerCase();
  const acronymLead = str.match(/^([A-Z]+)([A-Z][a-z].*)$/);
  if (acronymLead) {
    return acronymLead[1].toLowerCase() + acronymLead[2];
  }
  return str[0].toLowerCase() + str.slice(1);
}

function toPascal(str) {
  if (!str) return str;
  return str[0].toUpperCase() + str.slice(1);
}

function sanitizeIdent(name, fallbackPrefix = 'olId') {
  let n = String(name || '').replace(/[^A-Za-z0-9_]/g, '_');
  n = n.replace(/_+/g, '_');
  n = n.replace(/^_+|_+$/g, '');
  if (!n) n = fallbackPrefix;
  if (!/^[A-Za-z]/.test(n)) n = `${fallbackPrefix}_${n}`;
  if (nimKeywords.has(n)) n = `${n}Val`;
  return n;
}

function splitTopLevel(input, sep = ',') {
  const out = [];
  let cur = '';
  let dParen = 0;
  let dBrack = 0;
  let dBrace = 0;
  let dAngle = 0;
  let inStr = false;
  let strCh = '';

  for (let i = 0; i < input.length; i++) {
    const ch = input[i];
    const prev = i > 0 ? input[i - 1] : '';

    if (inStr) {
      cur += ch;
      if (ch === strCh && prev !== '\\') inStr = false;
      continue;
    }

    if (ch === '"' || ch === "'" || ch === '`') {
      inStr = true;
      strCh = ch;
      cur += ch;
      continue;
    }

    if (ch === '(') dParen++;
    else if (ch === ')') dParen = Math.max(0, dParen - 1);
    else if (ch === '[') dBrack++;
    else if (ch === ']') dBrack = Math.max(0, dBrack - 1);
    else if (ch === '{') dBrace++;
    else if (ch === '}') dBrace = Math.max(0, dBrace - 1);
    else if (ch === '<') dAngle++;
    else if (ch === '>') dAngle = Math.max(0, dAngle - 1);

    if (ch === sep && dParen === 0 && dBrack === 0 && dBrace === 0 && dAngle === 0) {
      const s = cur.trim();
      if (s) out.push(s);
      cur = '';
    } else {
      cur += ch;
    }
  }

  const tail = cur.trim();
  if (tail) out.push(tail);
  return out;
}

function extractBalanced(text, startIdx, openChar, closeChar) {
  if (text[startIdx] !== openChar) return null;
  let depth = 0;
  let content = '';
  for (let i = startIdx; i < text.length; i++) {
    const ch = text[i];
    if (ch === openChar) {
      depth++;
      if (depth > 1) content += ch;
    } else if (ch === closeChar) {
      depth--;
      if (depth === 0) {
        return { content, end: i };
      }
      content += ch;
    } else {
      content += ch;
    }
  }
  return null;
}

function normalizeTsType(ts) {
  return String(ts || '').replace(/\s+/g, ' ').trim();
}

function mapTsTypeToNim(tsType, optional = false) {
  let t = normalizeTsType(tsType);
  if (!t) return { nimType: 'JsObject', isVoid: false };

  if (optional) {
    t = t.replace(/\|\s*undefined/g, '').trim();
  }

  if (t === 'void' || t === 'never') return { nimType: 'void', isVoid: true };
  if (t === 'number') return { nimType: 'float', isVoid: false };
  if (t === 'boolean') return { nimType: 'bool', isVoid: false };
  if (t === 'string') return { nimType: 'cstring', isVoid: false };

  if (t.endsWith('[]')) {
    const inner = t.slice(0, -2).trim();
    const m = mapTsTypeToNim(inner, false);
    if (m.nimType === 'float' || m.nimType === 'bool' || m.nimType === 'cstring') {
      return { nimType: `seq[${m.nimType}]`, isVoid: false };
    }
    return { nimType: 'JsObject', isVoid: false };
  }

  if (t.startsWith('Array<') && t.endsWith('>')) {
    const inner = t.slice(6, -1).trim();
    const m = mapTsTypeToNim(inner, false);
    if (m.nimType === 'float' || m.nimType === 'bool' || m.nimType === 'cstring') {
      return { nimType: `seq[${m.nimType}]`, isVoid: false };
    }
    return { nimType: 'JsObject', isVoid: false };
  }

  if (t.includes('|')) {
    const parts = splitTopLevel(t, '|').map((p) => p.trim()).filter(Boolean);
    const mapped = [];
    for (const p0 of parts) {
      const p = p0.replace(/^\(|\)$/g, '').trim();
      if (p === 'number') mapped.push('float');
      else if (p === 'boolean') mapped.push('bool');
      else if (p === 'string') mapped.push('cstring');
      else if (p === 'null' || p === 'undefined') continue;
      else return { nimType: 'JsObject', isVoid: false };
    }
    const uniq = [...new Set(mapped)];
    if (uniq.length === 1) return { nimType: uniq[0], isVoid: false };
    if (uniq.length > 1) return { nimType: uniq.join(' | '), isVoid: false };
  }

  return { nimType: 'JsObject', isVoid: false };
}

function parseParams(paramsText) {
  const out = [];
  if (!paramsText || !paramsText.trim()) return out;
  const rawParts = splitTopLevel(paramsText, ',');
  let idx = 0;

  for (const rawPart of rawParts) {
    let p = rawPart.trim();
    if (!p) continue;

    let rest = false;
    if (p.startsWith('...')) {
      rest = true;
      p = p.slice(3).trim();
    }

    const colon = p.indexOf(':');
    if (colon < 0) {
      out.push({
        name: `arg${idx}`,
        originalName: `arg${idx}`,
        optional: true,
        rest,
        tsType: 'any',
        nimType: 'JsObject'
      });
      idx++;
      continue;
    }

    let rawName = p.slice(0, colon).trim();
    let tsType = p.slice(colon + 1).trim();

    rawName = rawName.replace(/^readonly\s+/, '');
    rawName = rawName.replace(/\s*=.*$/, '').trim();

    let optional = false;
    if (rawName.endsWith('?')) {
      optional = true;
      rawName = rawName.slice(0, -1).trim();
    }

    const cleanName = /^[A-Za-z_$][A-Za-z0-9_$]*$/.test(rawName)
      ? rawName
      : `arg${idx}`;

    const name = sanitizeIdent(cleanName, 'arg');
    const mapped = mapTsTypeToNim(tsType, optional || rest);

    out.push({
      name,
      originalName: cleanName,
      optional: optional || rest,
      rest,
      tsType,
      nimType: optional || rest ? 'JsObject' : mapped.nimType
    });
    idx++;
  }

  return out;
}

function paramsToNim(params) {
  return params.map((p) => {
    if (p.optional) return `${p.name}: JsObject = jsUndefined`;
    return `${p.name}: ${p.nimType}`;
  }).join(', ');
}

function placeholders(count) {
  if (count <= 0) return '';
  return Array(count).fill('#').join(', ');
}

function parseExportFunctions(cleanText) {
  const out = [];
  let pos = 0;

  while (true) {
    const idx = cleanText.indexOf('export function ', pos);
    if (idx < 0) break;

    let i = idx + 'export function '.length;
    const nameMatch = cleanText.slice(i).match(/^([A-Za-z_$][A-Za-z0-9_$]*)/);
    if (!nameMatch) {
      pos = i;
      continue;
    }
    const name = nameMatch[1];
    i += name.length;

    while (i < cleanText.length && /\s/.test(cleanText[i])) i++;
    if (cleanText[i] === '<') {
      const g = extractBalanced(cleanText, i, '<', '>');
      if (g) i = g.end + 1;
    }

    while (i < cleanText.length && /\s/.test(cleanText[i])) i++;
    if (cleanText[i] !== '(') {
      pos = i + 1;
      continue;
    }

    const p = extractBalanced(cleanText, i, '(', ')');
    if (!p) {
      pos = i + 1;
      continue;
    }

    i = p.end + 1;
    while (i < cleanText.length && /\s/.test(cleanText[i])) i++;

    let returnType = 'void';
    if (cleanText[i] === ':') {
      i++;
      let ret = '';
      let dParen = 0;
      let dBrack = 0;
      let dBrace = 0;
      let dAngle = 0;
      while (i < cleanText.length) {
        const ch = cleanText[i];
        if (ch === '(') dParen++;
        else if (ch === ')') dParen = Math.max(0, dParen - 1);
        else if (ch === '[') dBrack++;
        else if (ch === ']') dBrack = Math.max(0, dBrack - 1);
        else if (ch === '{') dBrace++;
        else if (ch === '}') dBrace = Math.max(0, dBrace - 1);
        else if (ch === '<') dAngle++;
        else if (ch === '>') dAngle = Math.max(0, dAngle - 1);

        if (ch === ';' && dParen === 0 && dBrack === 0 && dBrace === 0 && dAngle === 0) {
          break;
        }
        ret += ch;
        i++;
      }
      returnType = normalizeTsType(ret);
    }

    out.push({ name, paramsText: p.content.trim(), returnType });
    pos = i + 1;
  }

  return out;
}

function parseExportConsts(cleanText) {
  const out = [];
  const re = /export\s+(?:declare\s+)?(?:const|let|var)\s+([A-Za-z_$][A-Za-z0-9_$]*)\s*:\s*([^;]+);/g;
  for (const m of cleanText.matchAll(re)) {
    out.push({ name: m[1], type: normalizeTsType(m[2]) });
  }
  return out;
}

function parseReExports(cleanText) {
  const out = [];
  const statements = splitTopLevel(cleanText, ';');
  for (const statementRaw of statements) {
    const statement = statementRaw.trim();
    if (!statement.startsWith('export')) continue;

    const fromMatch = statement.match(/^export\s*\{([\s\S]*?)\}\s*from\s*['"]([^'"]+)['"]$/);
    if (fromMatch) {
      const entries = splitTopLevel(fromMatch[1], ',');
      for (const entry of entries) {
        const e = entry.trim();
        if (!e) continue;
        const mm = e.match(/^(.+?)\s+as\s+(.+)$/);
        const exported = mm ? mm[2].trim() : e;
        out.push({ exported: exported.replace(/^default$/, 'default'), from: fromMatch[2] });
      }
      continue;
    }

    const localMatch = statement.match(/^export\s*\{([\s\S]*?)\}$/);
    if (localMatch) {
      const entries = splitTopLevel(localMatch[1], ',');
      for (const entry of entries) {
        const e = entry.trim();
        if (!e) continue;
        const mm = e.match(/^(.+?)\s+as\s+(.+)$/);
        const exported = mm ? mm[2].trim() : e;
        out.push({ exported, from: null });
      }
    }
  }

  return out;
}

function parseClassMembers(classBody) {
  const members = [];
  const constructors = [];

  const statements = splitTopLevel(classBody, ';');
  for (const stRaw of statements) {
    let st = stRaw.trim();
    if (!st) continue;

    st = st.replace(/^(?:public|private|protected|readonly|abstract)\s+/g, '');

    if (st.startsWith('constructor(')) {
      const idx = st.indexOf('(');
      const p = extractBalanced(st, idx, '(', ')');
      if (p) constructors.push({ paramsText: p.content.trim() });
      continue;
    }

    let isStatic = false;
    if (st.startsWith('static ')) {
      isStatic = true;
      st = st.slice('static '.length).trim();
    }

    const nameMatch = st.match(/^([A-Za-z_$][A-Za-z0-9_$]*)/);
    if (!nameMatch) continue;

    const name = nameMatch[1];
    let i = name.length;
    while (i < st.length && /\s/.test(st[i])) i++;

    if (st[i] === '<') {
      const g = extractBalanced(st, i, '<', '>');
      if (g) i = g.end + 1;
    }

    while (i < st.length && /\s/.test(st[i])) i++;
    if (st[i] !== '(') continue;

    const p = extractBalanced(st, i, '(', ')');
    if (!p) continue;

    i = p.end + 1;
    while (i < st.length && /\s/.test(st[i])) i++;

    let returnType = 'void';
    if (st[i] === ':') {
      returnType = normalizeTsType(st.slice(i + 1));
    }

    members.push({
      name,
      static: isStatic,
      paramsText: p.content.trim(),
      returnType
    });
  }

  return { constructors, members };
}

function parseClasses(cleanText) {
  const out = [];
  let pos = 0;
  while (true) {
    const idx = cleanText.indexOf('declare class ', pos);
    if (idx < 0) break;

    const nameStart = idx + 'declare class '.length;
    const nameMatch = cleanText.slice(nameStart).match(/^([A-Za-z_$][A-Za-z0-9_$]*)/);
    if (!nameMatch) {
      pos = nameStart;
      continue;
    }
    const name = nameMatch[1];
    const afterName = nameStart + name.length;

    const braceIdx = cleanText.indexOf('{', afterName);
    if (braceIdx < 0) break;

    const b = extractBalanced(cleanText, braceIdx, '{', '}');
    if (!b) break;

    const classDeclPrefix = cleanText.slice(Math.max(0, idx - 24), idx);
    const exported = /\bexport\s*$/.test(classDeclPrefix) || /\bexport\s+declare\s+class\b/.test(cleanText.slice(idx - 8, braceIdx));
    const parsed = parseClassMembers(b.content);
    out.push({ name, exported, constructors: parsed.constructors, methods: parsed.members });

    pos = b.end + 1;
  }
  return out;
}

function parseModule(text) {
  const cleanText = stripComments(text);

  const defaultMatch = cleanText.match(/export\s+default\s+([A-Za-z_$][A-Za-z0-9_$]*)\s*;/);
  const defaultExport = defaultMatch ? defaultMatch[1] : null;

  const functions = parseExportFunctions(cleanText).map((f) => ({
    name: f.name,
    params: parseParams(f.paramsText),
    returnType: f.returnType
  }));

  const consts = parseExportConsts(cleanText);
  const reexports = parseReExports(cleanText);
  const classes = parseClasses(cleanText);

  return { defaultExport, functions, consts, reexports, classes };
}

function collectDtsFiles(root) {
  const out = [];
  const stack = [root];
  while (stack.length > 0) {
    const dir = stack.pop();
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    for (const e of entries) {
      const full = path.join(dir, e.name);
      if (e.isDirectory()) {
        stack.push(full);
      } else if (e.isFile() && e.name.endsWith('.d.ts')) {
        out.push(full);
      }
    }
  }
  return out.sort();
}

function nimModulePathFromDtsRel(rel) {
  const withoutExt = rel.replace(/\.d\.ts$/, '');
  const parts = withoutExt.split(path.sep).map((seg) => toLowerCamel(seg));
  return parts.join('/');
}

function ensureDir(filePath) {
  fs.mkdirSync(path.dirname(filePath), { recursive: true });
}

function fetchUrlText(url) {
  return new Promise((resolve, reject) => {
    https.get(url, (res) => {
      if (res.statusCode && res.statusCode >= 400) {
        reject(new Error(`HTTP ${res.statusCode} for ${url}`));
        return;
      }

      let data = '';
      res.setEncoding('utf8');
      res.on('data', (chunk) => {
        data += chunk;
      });
      res.on('end', () => resolve(data));
    }).on('error', reject);
  });
}

function parsePublicModulesFromApidocNav(navHtml) {
  const modules = new Set();
  const re = /data-longname="([^"]+)"/g;
  let m;

  while ((m = re.exec(navHtml)) !== null) {
    const longName = m[1];
    if (!longName.startsWith('module:ol/')) continue;
    let moduleId = longName.slice('module:ol/'.length);
    moduleId = moduleId.split('~')[0].split('.')[0];
    if (moduleId) modules.add(moduleId);
  }

  for (const moduleId of manualPublicModules) modules.add(moduleId);
  return modules;
}

function buildWrapper(moduleId, moduleInfo, nimRelModulePath) {
  const nsAlias = sanitizeIdent(`olNs_${moduleId.replace(/[^A-Za-z0-9_]/g, '_')}`, 'olNs');
  const lines = [];
  const usedProcNames = new Map();

  function uniqueProcName(raw) {
    const base = sanitizeIdent(raw, 'olProc');
    const count = usedProcNames.get(base) || 0;
    usedProcNames.set(base, count + 1);
    return count === 0 ? base : `${base}${count + 1}`;
  }

  function addProc(name, params, returnType, importjsExpr) {
    const procName = uniqueProcName(name);
    const paramDecl = paramsToNim(params);
    const mappedRet = mapTsTypeToNim(returnType, false);
    const signature = mappedRet.isVoid
      ? `proc ${procName}*(${paramDecl})`
      : `proc ${procName}*(${paramDecl}): ${mappedRet.nimType}`;
    lines.push(`${signature} {.importjs: "${importjsExpr}".}`);
  }

  lines.push('import jsffi');
  lines.push('');
  lines.push('when not defined(js):');
  lines.push('  {.fatal: "openlayers bindings require Nim\'s JavaScript backend.".}');
  lines.push('');
  lines.push('when defined(esmModules):');
  lines.push(`  {.emit: "import * as ${nsAlias} from 'ol/${moduleId}.js';".}`);
  lines.push('');
  lines.push(`proc getNamespace*(): JsObject {.importjs: "(${nsAlias})".}`);

  const classMap = new Map(moduleInfo.classes.map((c) => [c.name, c]));

  const exportedClasses = new Map();
  for (const c of moduleInfo.classes) {
    if (c.exported) exportedClasses.set(c.name, { class: c, exportRef: `${nsAlias}.${c.name}` });
  }
  if (moduleInfo.defaultExport && classMap.has(moduleInfo.defaultExport)) {
    exportedClasses.set(moduleInfo.defaultExport, {
      class: classMap.get(moduleInfo.defaultExport),
      exportRef: `${nsAlias}.default`
    });
  }

  for (const [className, meta] of exportedClasses.entries()) {
    const nimClassName = sanitizeIdent(`Ol${toPascal(className)}`, 'OlClass');
    lines.push('');
    lines.push('type');
    lines.push(`  ${nimClassName}* = ref object of JsRoot`);

    const ctors = meta.class.constructors.length > 0 ? meta.class.constructors : [{ paramsText: '' }];
    for (const ctor of ctors) {
      const params = parseParams(ctor.paramsText);
      const paramDecl = paramsToNim(params);
      const ph = placeholders(params.length);
      const js = ph ? `(new ${meta.exportRef}(${ph}))` : `(new ${meta.exportRef}())`;
      const procName = uniqueProcName(`new${nimClassName}`);
      lines.push(`proc ${procName}*(${paramDecl}): ${nimClassName} {.importjs: "${js}".}`);
    }

    for (const m of meta.class.methods) {
      const params = parseParams(m.paramsText);
      const mappedRet = mapTsTypeToNim(m.returnType, false);
      const ph = placeholders(params.length);
      const methodExpr = m.static
        ? `${meta.exportRef}.${m.name}${ph ? `(${ph})` : '()'}`
        : `#.${m.name}${ph ? `(${ph})` : '()'}`;

      const methodProcName = m.static
        ? `${toLowerCamel(className)}${toPascal(m.name)}`
        : m.name;
      const procName = uniqueProcName(methodProcName);

      if (m.static) {
        const paramDecl = paramsToNim(params);
        const sig = mappedRet.isVoid
          ? `proc ${procName}*(${paramDecl})`
          : `proc ${procName}*(${paramDecl}): ${mappedRet.nimType}`;
        lines.push(`${sig} {.importjs: "${methodExpr}".}`);
      } else {
        const allParams = [{ name: 'self', nimType: nimClassName, optional: false }, ...params];
        const paramDecl = allParams.map((p) => {
          if (p.name === 'self') return `self: ${nimClassName}`;
          if (p.optional) return `${p.name}: JsObject = jsUndefined`;
          return `${p.name}: ${p.nimType}`;
        }).join(', ');
        const sig = mappedRet.isVoid
          ? `proc ${procName}*(${paramDecl})`
          : `proc ${procName}*(${paramDecl}): ${mappedRet.nimType}`;
        lines.push(`${sig} {.importjs: "${methodExpr}".}`);
      }
    }
  }

  if (moduleInfo.functions.length > 0) lines.push('');
  for (const fn of moduleInfo.functions) {
    const procName = uniqueProcName(fn.name);
    const params = fn.params;
    const paramDecl = paramsToNim(params);
    const mappedRet = mapTsTypeToNim(fn.returnType, false);
    const ph = placeholders(params.length);
    const expr = `${nsAlias}.${fn.name}${ph ? `(${ph})` : '()'}`;
    const sig = mappedRet.isVoid
      ? `proc ${procName}*(${paramDecl})`
      : `proc ${procName}*(${paramDecl}): ${mappedRet.nimType}`;
    lines.push(`${sig} {.importjs: "${expr}".}`);
  }

  const handledConst = new Set();
  if (moduleInfo.consts.length > 0) lines.push('');
  for (const c of moduleInfo.consts) {
    handledConst.add(c.name);
    const getter = uniqueProcName(`get${toPascal(c.name)}`);
    const mapped = mapTsTypeToNim(c.type, false);
    const sig = mapped.isVoid
      ? `proc ${getter}*()`
      : `proc ${getter}*(): ${mapped.nimType}`;
    lines.push(`${sig} {.importjs: "(${nsAlias}.${c.name})".}`);
  }

  const handledReexport = new Set();
  if (moduleInfo.reexports.length > 0) lines.push('');
  for (const r of moduleInfo.reexports) {
    if (!r.exported || r.exported === 'default') continue;
    if (handledConst.has(r.exported)) continue;
    if (handledReexport.has(r.exported)) continue;
    handledReexport.add(r.exported);

    const getter = uniqueProcName(`get${toPascal(r.exported)}`);
    lines.push(`proc ${getter}*(): JsObject {.importjs: "(${nsAlias}.${r.exported})".}`);
  }

  lines.push('');
  return lines.join('\n');
}

async function main() {
  const navHtml = await fetchUrlText(apidocNavUrl);
  const publicModules = parsePublicModulesFromApidocNav(navHtml);
  const dtsFiles = collectDtsFiles(olRoot);
  const publicDtsFiles = dtsFiles.filter((file) => {
    const rel = path.relative(olRoot, file);
    const moduleId = rel.replace(/\\/g, '/').replace(/\.d\.ts$/, '');
    return publicModules.has(moduleId);
  });

  fs.rmSync(outWrapRoot, { recursive: true, force: true });
  fs.mkdirSync(outWrapRoot, { recursive: true });
  fs.mkdirSync(path.dirname(outApiFile), { recursive: true });

  const manifest = {
    generatedAt: new Date().toISOString(),
    sourceRoot: 'node_modules/ol',
    apidocNavUrl,
    apidocModuleCount: publicModules.size,
    scannedModuleCount: dtsFiles.length,
    moduleCount: publicDtsFiles.length,
    modules: []
  };

  let wrapperCount = 0;

  for (const file of publicDtsFiles) {
    const rel = path.relative(olRoot, file);
    const moduleId = rel.replace(/\\/g, '/').replace(/\.d\.ts$/, '');
    const nimRel = nimModulePathFromDtsRel(rel.replace(/\\/g, '/'));
    const outFile = path.join(outWrapRoot, `${nimRel}.nim`);

    const text = fs.readFileSync(file, 'utf8');
    const info = parseModule(text);

    const wrapper = buildWrapper(moduleId, info, nimRel);
    ensureDir(outFile);
    fs.writeFileSync(outFile, wrapper);

    manifest.modules.push({
      moduleId,
      dtsPath: rel.replace(/\\/g, '/'),
      nimModule: `openlayers/${nimRel}`,
      defaultExport: info.defaultExport,
      functions: info.functions.map((f) => ({
        name: f.name,
        params: f.params.map((p) => ({
          name: p.originalName,
          optional: p.optional,
          tsType: p.tsType,
          nimType: p.nimType
        })),
        returnType: f.returnType
      })),
      constants: info.consts,
      reexports: info.reexports,
      classes: info.classes.map((c) => ({
        name: c.name,
        exported: c.exported,
        constructors: c.constructors,
        methods: c.methods
      }))
    });

    wrapperCount++;
  }

  fs.writeFileSync(outApiFile, JSON.stringify(manifest, null, 2) + '\n');

  console.log(`Generated API manifest: ${path.relative(repoRoot, outApiFile)}`);
  console.log(`Public modules from API docs: ${publicModules.size}`);
  console.log(`Generated wrappers: ${wrapperCount} modules under ${path.relative(repoRoot, outWrapRoot)}`);
}

main().catch((err) => {
  console.error(String(err && err.stack ? err.stack : err));
  process.exit(1);
});
