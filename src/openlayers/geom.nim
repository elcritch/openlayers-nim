import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olGeomNamespace from 'ol/geom.js';".}
proc getGeomNamespace*(): JsObject {.importjs: "(olGeomNamespace)".}
