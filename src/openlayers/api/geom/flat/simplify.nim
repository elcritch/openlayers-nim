import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_simplify from 'ol/geom/flat/simplify.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_simplify)".}

proc simplifyLineString*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, squaredTolerance: float, highQuality: bool, simplifiedFlatCoordinates: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_simplify.simplifyLineString(#, #, #, #, #, #, #)".}
proc douglasPeucker*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, squaredTolerance: float, simplifiedFlatCoordinates: seq[float], simplifiedOffset: float): float {.importjs: "olNs_geom_flat_simplify.douglasPeucker(#, #, #, #, #, #, #)".}
proc douglasPeuckerArray*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, squaredTolerance: float, simplifiedFlatCoordinates: seq[float], simplifiedOffset: float, simplifiedEnds: seq[float]): float {.importjs: "olNs_geom_flat_simplify.douglasPeuckerArray(#, #, #, #, #, #, #, #)".}
proc douglasPeuckerMultiArray*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, squaredTolerance: float, simplifiedFlatCoordinates: seq[float], simplifiedOffset: float, simplifiedEndss: JsObject): float {.importjs: "olNs_geom_flat_simplify.douglasPeuckerMultiArray(#, #, #, #, #, #, #, #)".}
proc radialDistance*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, squaredTolerance: float, simplifiedFlatCoordinates: seq[float], simplifiedOffset: float): float {.importjs: "olNs_geom_flat_simplify.radialDistance(#, #, #, #, #, #, #)".}
proc snap*(value: float, tolerance: float): float {.importjs: "olNs_geom_flat_simplify.snap(#, #)".}
proc quantize*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, tolerance: float, simplifiedFlatCoordinates: seq[float], simplifiedOffset: float): float {.importjs: "olNs_geom_flat_simplify.quantize(#, #, #, #, #, #, #)".}
proc quantizeArray*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, tolerance: float, simplifiedFlatCoordinates: seq[float], simplifiedOffset: float, simplifiedEnds: seq[float]): float {.importjs: "olNs_geom_flat_simplify.quantizeArray(#, #, #, #, #, #, #, #)".}
proc quantizeMultiArray*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, tolerance: float, simplifiedFlatCoordinates: seq[float], simplifiedOffset: float, simplifiedEndss: JsObject): float {.importjs: "olNs_geom_flat_simplify.quantizeMultiArray(#, #, #, #, #, #, #, #)".}
