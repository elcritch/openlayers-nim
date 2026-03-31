import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_interiorpoint from 'ol/geom/flat/interiorpoint.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_interiorpoint)".}

proc getInteriorPointOfArray*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, flatCenters: seq[float], flatCentersOffset: float, dest: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_interiorpoint.getInteriorPointOfArray(#, #, #, #, #, #, #)".}
proc getInteriorPointsOfMultiArray*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, flatCenters: seq[float]): seq[float] {.importjs: "olNs_geom_flat_interiorpoint.getInteriorPointsOfMultiArray(#, #, #, #, #)".}
