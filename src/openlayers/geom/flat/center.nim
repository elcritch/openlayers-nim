import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_center from 'ol/geom/flat/center.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_center)".}

proc linearRingss*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float): seq[float] {.importjs: "olNs_geom_flat_center.linearRingss(#, #, #, #)".}
