import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olStyleNamespace from 'ol/style.js';".}

proc hasStyleNamespace*(): bool {.
  importjs: "(typeof olStyleNamespace !== 'undefined')"
.}

proc getStyleNamespace*(): JsObject {.importjs: "(olStyleNamespace)".}
