import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_sphere from 'ol/sphere.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_sphere)".}

proc getDistance*(c1: JsObject, c2: JsObject, radius: JsObject = jsUndefined): float {.importjs: "olNs_sphere.getDistance(#, #, #)".}
proc getLength*(geometry: JsObject, options: JsObject = jsUndefined): float {.importjs: "olNs_sphere.getLength(#, #)".}
proc getArea*(geometry: JsObject, options: JsObject = jsUndefined): float {.importjs: "olNs_sphere.getArea(#, #)".}
proc offset*(c1: JsObject, distance: float, bearing: float, radius: JsObject = jsUndefined): JsObject {.importjs: "olNs_sphere.offset(#, #, #, #)".}

proc getDEFAULT_RADIUS*(): float {.importjs: "(olNs_sphere.DEFAULT_RADIUS)".}
