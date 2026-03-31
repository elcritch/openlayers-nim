import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_orient from 'ol/geom/flat/orient.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_orient)".}

proc linearRingIsClockwise*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float): bool {.importjs: "olNs_geom_flat_orient.linearRingIsClockwise(#, #, #, #)".}
proc linearRingsAreOriented*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, right: JsObject = jsUndefined): bool {.importjs: "olNs_geom_flat_orient.linearRingsAreOriented(#, #, #, #, #)".}
proc linearRingssAreOriented*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, right: JsObject = jsUndefined): bool {.importjs: "olNs_geom_flat_orient.linearRingssAreOriented(#, #, #, #, #)".}
proc orientLinearRings*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, right: JsObject = jsUndefined): float {.importjs: "olNs_geom_flat_orient.orientLinearRings(#, #, #, #, #)".}
proc orientLinearRingsArray*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, right: JsObject = jsUndefined): float {.importjs: "olNs_geom_flat_orient.orientLinearRingsArray(#, #, #, #, #)".}
proc inflateEnds*(flatCoordinates: seq[float], ends: seq[float]): JsObject {.importjs: "olNs_geom_flat_orient.inflateEnds(#, #)".}
