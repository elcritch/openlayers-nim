import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_sphere from 'ol/sphere.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_sphere)".}

proc getDistance*(c1: JsObject, c2: JsObject, radius: JsObject = jsUndefined): float {.importjs: "olNs_sphere.getDistance(#, #, #)".}
proc getLength*(geometry: JsObject, options: JsObject = jsUndefined): float {.importjs: "olNs_sphere.getLength(#, #)".}
proc getArea*(geometry: JsObject, options: JsObject = jsUndefined): float {.importjs: "olNs_sphere.getArea(#, #)".}
proc offset*(c1: JsObject, distance: float, bearing: float, radius: JsObject = jsUndefined): JsObject {.importjs: "olNs_sphere.offset(#, #, #, #)".}

proc getDEFAULT_RADIUS*(): float {.importjs: "(olNs_sphere.DEFAULT_RADIUS)".}

type
  SphereMetricOptions* = ref object of JsRoot

proc newSphereMetricOptions*(): SphereMetricOptions {.importjs: "({})".}
proc `projection=`*(options: SphereMetricOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: SphereMetricOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `radius=`*(options: SphereMetricOptions, value: float) {.importjs: "#.radius = #".}
