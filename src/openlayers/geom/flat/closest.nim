import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_closest from 'ol/geom/flat/closest.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_closest)".}

proc maxSquaredDelta*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, max: float): float {.importjs: "olNs_geom_flat_closest.maxSquaredDelta(#, #, #, #, #)".}
proc arrayMaxSquaredDelta*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, max: float): float {.importjs: "olNs_geom_flat_closest.arrayMaxSquaredDelta(#, #, #, #, #)".}
proc multiArrayMaxSquaredDelta*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, max: float): float {.importjs: "olNs_geom_flat_closest.multiArrayMaxSquaredDelta(#, #, #, #, #)".}
proc assignClosestPoint*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, maxDelta: float, isRing: bool, x: float, y: float, closestPoint: seq[float], minSquaredDistance: float, tmpPoint: JsObject = jsUndefined): float {.importjs: "olNs_geom_flat_closest.assignClosestPoint(#, #, #, #, #, #, #, #, #, #, #)".}
proc assignClosestArrayPoint*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, maxDelta: float, isRing: bool, x: float, y: float, closestPoint: seq[float], minSquaredDistance: float, tmpPoint: JsObject = jsUndefined): float {.importjs: "olNs_geom_flat_closest.assignClosestArrayPoint(#, #, #, #, #, #, #, #, #, #, #)".}
proc assignClosestMultiArrayPoint*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, maxDelta: float, isRing: bool, x: float, y: float, closestPoint: seq[float], minSquaredDistance: float, tmpPoint: JsObject = jsUndefined): float {.importjs: "olNs_geom_flat_closest.assignClosestMultiArrayPoint(#, #, #, #, #, #, #, #, #, #, #)".}
