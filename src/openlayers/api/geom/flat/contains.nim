import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_contains from 'ol/geom/flat/contains.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_contains)".}

proc linearRingContainsExtent*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, extent: JsObject): bool {.importjs: "olNs_geom_flat_contains.linearRingContainsExtent(#, #, #, #, #)".}
proc linearRingContainsXY*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, x: float, y: float): bool {.importjs: "olNs_geom_flat_contains.linearRingContainsXY(#, #, #, #, #, #)".}
proc linearRingsContainsXY*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, x: float, y: float): bool {.importjs: "olNs_geom_flat_contains.linearRingsContainsXY(#, #, #, #, #, #)".}
proc linearRingssContainsXY*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, x: float, y: float): bool {.importjs: "olNs_geom_flat_contains.linearRingssContainsXY(#, #, #, #, #, #)".}
