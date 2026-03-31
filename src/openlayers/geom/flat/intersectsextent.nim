import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_intersectsextent from 'ol/geom/flat/intersectsextent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_intersectsextent)".}

proc intersectsLineString*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, extent: JsObject, coordinatesExtent: JsObject = jsUndefined): bool {.importjs: "olNs_geom_flat_intersectsextent.intersectsLineString(#, #, #, #, #, #)".}
proc intersectsLineStringArray*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, extent: JsObject): bool {.importjs: "olNs_geom_flat_intersectsextent.intersectsLineStringArray(#, #, #, #, #)".}
proc intersectsLinearRing*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, extent: JsObject): bool {.importjs: "olNs_geom_flat_intersectsextent.intersectsLinearRing(#, #, #, #, #)".}
proc intersectsLinearRingArray*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, extent: JsObject): bool {.importjs: "olNs_geom_flat_intersectsextent.intersectsLinearRingArray(#, #, #, #, #)".}
proc intersectsLinearRingMultiArray*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, extent: JsObject): bool {.importjs: "olNs_geom_flat_intersectsextent.intersectsLinearRingMultiArray(#, #, #, #, #)".}
