import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_reverse from 'ol/geom/flat/reverse.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_reverse)".}

proc coordinates*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float) {.importjs: "olNs_geom_flat_reverse.coordinates(#, #, #, #)".}
