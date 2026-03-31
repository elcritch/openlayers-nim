import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olControlNamespace from 'ol/control.js';".}

proc hasControlNamespace*(): bool {.
  importjs: "(typeof olControlNamespace !== 'undefined')"
.}

proc getControlNamespace*(): JsObject {.importjs: "(olControlNamespace)".}
