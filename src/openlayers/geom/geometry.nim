import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_geom_Geometry from 'ol/geom/Geometry.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_Geometry)".}

type Geometry* = ref object of JsRoot
proc newGeometry*(): Geometry {.importjs: "(new olNs_geom_Geometry.default())".}
proc getType*(self: Geometry): cstring {.importjs: "#.getType()".}
