import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_area from 'ol/geom/flat/area.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_area)".}

proc linearRing*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float): float {.importjs: "olNs_geom_flat_area.linearRing(#, #, #, #)".}
proc linearRings*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float): float {.importjs: "olNs_geom_flat_area.linearRings(#, #, #, #)".}
proc linearRingss*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float): float {.importjs: "olNs_geom_flat_area.linearRingss(#, #, #, #)".}
