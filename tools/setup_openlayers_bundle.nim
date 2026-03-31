import std/[json, os, osproc, strutils]

const
  defaultPackage = "latest"
  projectRoot = currentSourcePath().parentDir.parentDir
  outputDir = projectRoot / "deps" / "openlayers_bundle"

proc fetchText(url: string): string =
  echo "Downloading ", url
  let (output, exitCode) = execCmdEx("curl -fsSL " & quoteShell(url))
  if exitCode != 0:
    raise newException(IOError, "curl failed for " & url)
  result = output

proc main() =
  let requestedVersion =
    if paramCount() >= 1:
      paramStr(1).strip()
    else:
      defaultPackage

  let packageUrl =
    "https://cdn.jsdelivr.net/npm/ol@" & requestedVersion & "/package.json"
  let packageJson = parseJson(fetchText(packageUrl))
  let resolvedVersion = packageJson["version"].getStr

  let jsUrl = "https://cdn.jsdelivr.net/npm/ol@" & requestedVersion & "/dist/ol.js"
  let cssUrl = "https://cdn.jsdelivr.net/npm/ol@" & requestedVersion & "/ol.css"

  createDir(outputDir)
  writeFile(outputDir / "ol.js", fetchText(jsUrl))
  writeFile(outputDir / "ol.css", fetchText(cssUrl))
  writeFile(outputDir / "VERSION", resolvedVersion & "\n")

  echo "OpenLayers bundle ready:"
  echo "  version: ", resolvedVersion
  echo "  js: ", outputDir / "ol.js"
  echo "  css: ", outputDir / "ol.css"

when isMainModule:
  main()
