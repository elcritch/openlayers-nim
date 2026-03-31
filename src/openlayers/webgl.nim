import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olWebglNamespace from 'ol/webgl.js';".}

proc hasWebglNamespace*(): bool {.
  importjs: "(typeof olWebglNamespace !== 'undefined')"
.}

proc getWebglNamespace*(): JsObject {.importjs: "(olWebglNamespace)".}
