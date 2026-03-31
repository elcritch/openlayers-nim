import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_hitdetect from 'ol/render/canvas/hitdetect.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_hitdetect)".}

proc createHitDetectionImageData*(size: JsObject, transforms: JsObject, features: JsObject, styleFunction: JsObject, extent: JsObject, resolution: float, rotation: float, squaredTolerance: JsObject = jsUndefined, projection: JsObject = jsUndefined): JsObject {.importjs: "olNs_render_canvas_hitdetect.createHitDetectionImageData(#, #, #, #, #, #, #, #, #)".}
proc hitDetect*(pixel: JsObject, features: JsObject, imageData: JsObject): JsObject {.importjs: "olNs_render_canvas_hitdetect.hitDetect(#, #, #)".}

proc getHIT_DETECT_RESOLUTION*(): JsObject {.importjs: "(olNs_render_canvas_hitdetect.HIT_DETECT_RESOLUTION)".}
