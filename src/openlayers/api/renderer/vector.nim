import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_vector from 'ol/renderer/vector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_vector)".}

proc defaultOrder*(feature1: JsObject, feature2: JsObject): float {.importjs: "olNs_renderer_vector.defaultOrder(#, #)".}
proc getSquaredTolerance*(resolution: float, pixelRatio: float): float {.importjs: "olNs_renderer_vector.getSquaredTolerance(#, #)".}
proc getTolerance*(resolution: float, pixelRatio: float): float {.importjs: "olNs_renderer_vector.getTolerance(#, #)".}
proc renderFeature*(replayGroup: JsObject, feature: JsObject, style: JsObject, squaredTolerance: float, listener: JsObject, transform: JsObject = jsUndefined, declutter: JsObject = jsUndefined, index: JsObject = jsUndefined): bool {.importjs: "olNs_renderer_vector.renderFeature(#, #, #, #, #, #, #, #)".}
