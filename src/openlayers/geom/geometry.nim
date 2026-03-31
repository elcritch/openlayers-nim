import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_Geometry from 'ol/geom/Geometry.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_Geometry)".}

type
  OlGeometry* = ref object of JsRoot
proc newOlGeometry*(): OlGeometry {.importjs: "(new olNs_geom_Geometry.default())".}
