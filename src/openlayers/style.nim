import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olStyleNamespace from 'ol/style.js';".}

proc getStyleNamespace*(): JsObject {.importjs: "(olStyleNamespace)".}
