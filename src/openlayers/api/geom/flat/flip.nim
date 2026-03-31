import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_flip from 'ol/geom/flat/flip.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_flip)".}

proc flipXY*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, dest: JsObject = jsUndefined, destOffset: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_flip.flipXY(#, #, #, #, #, #)".}
