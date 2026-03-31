import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olWebglNamespace from 'ol/webgl.js';".}

proc getWebglNamespace*(): JsObject {.importjs: "(olWebglNamespace)".}
