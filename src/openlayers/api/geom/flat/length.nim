import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_length from 'ol/geom/flat/length.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_length)".}

proc lineStringLength*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float): float {.importjs: "olNs_geom_flat_length.lineStringLength(#, #, #, #)".}
proc linearRingLength*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float): float {.importjs: "olNs_geom_flat_length.linearRingLength(#, #, #, #)".}
