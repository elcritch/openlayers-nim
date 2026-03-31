import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_PostProcessingPass from 'ol/webgl/PostProcessingPass.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_PostProcessingPass)".}

type
  OlWebGLPostProcessingPass* = ref object of JsRoot
proc newOlWebGLPostProcessingPass*(options: JsObject): OlWebGLPostProcessingPass {.importjs: "(new olNs_webgl_PostProcessingPass.default(#))".}
proc getRenderTargetTexture*(self: OlWebGLPostProcessingPass): JsObject {.importjs: "#.getRenderTargetTexture()".}
proc getGL*(self: OlWebGLPostProcessingPass): JsObject {.importjs: "#.getGL()".}
proc init*(self: OlWebGLPostProcessingPass, frameState: JsObject) {.importjs: "#.init(#)".}
proc apply*(self: OlWebGLPostProcessingPass, frameState: JsObject, nextPass: JsObject = jsUndefined, preCompose: JsObject = jsUndefined, postCompose: JsObject = jsUndefined) {.importjs: "#.apply(#, #, #, #)".}
proc getFrameBuffer*(self: OlWebGLPostProcessingPass): JsObject {.importjs: "#.getFrameBuffer()".}
proc getDepthBuffer*(self: OlWebGLPostProcessingPass): JsObject {.importjs: "#.getDepthBuffer()".}
