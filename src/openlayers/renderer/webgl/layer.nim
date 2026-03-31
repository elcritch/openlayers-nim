import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_Layer from 'ol/renderer/webgl/Layer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_Layer)".}

type
  OlWebGLLayerRenderer* = ref object of JsRoot
proc newOlWebGLLayerRenderer*(layer: JsObject, options: JsObject = jsUndefined): OlWebGLLayerRenderer {.importjs: "(new olNs_renderer_webgl_Layer.default(#, #))".}
proc dispatchPreComposeEvent*(self: OlWebGLLayerRenderer, context: JsObject, frameState: JsObject) {.importjs: "#.dispatchPreComposeEvent(#, #)".}
proc dispatchPostComposeEvent*(self: OlWebGLLayerRenderer, context: JsObject, frameState: JsObject) {.importjs: "#.dispatchPostComposeEvent(#, #)".}
proc reset*(self: OlWebGLLayerRenderer, options: JsObject) {.importjs: "#.reset(#)".}
proc removeHelper*(self: OlWebGLLayerRenderer) {.importjs: "#.removeHelper()".}
proc afterHelperCreated*(self: OlWebGLLayerRenderer) {.importjs: "#.afterHelperCreated()".}
proc prepareFrameInternal*(self: OlWebGLLayerRenderer, frameState: JsObject): bool {.importjs: "#.prepareFrameInternal(#)".}
proc clearCache*(self: OlWebGLLayerRenderer) {.importjs: "#.clearCache()".}
proc preRender*(self: OlWebGLLayerRenderer, context: JsObject, frameState: JsObject) {.importjs: "#.preRender(#, #)".}
proc postRender*(self: OlWebGLLayerRenderer, context: JsObject, frameState: JsObject) {.importjs: "#.postRender(#, #)".}
