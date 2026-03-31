import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olObjectModule from 'ol/Object.js';".}
{.emit: "import BaseObject from 'ol/Object.js';".}

proc hasObjectModule*(): bool {.importjs: "(typeof olObjectModule !== 'undefined')".}
proc hasBaseObjectConstructor*(): bool {.
  importjs: "(typeof BaseObject === 'function')"
.}

type OlBaseObject* = ref object of JsRoot

proc newOlBaseObject*(): OlBaseObject {.importjs: "(new BaseObject())".}
