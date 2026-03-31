import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_VectorLayer from 'ol/renderer/webgl/VectorLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_VectorLayer)".}

type
  OlWebGLVectorLayerRenderer* = ref object of JsRoot
proc newOlWebGLVectorLayerRenderer*(layer: JsObject, options: JsObject): OlWebGLVectorLayerRenderer {.importjs: "(new olNs_renderer_webgl_VectorLayer.default(#, #))".}
proc renderWorlds*(self: OlWebGLVectorLayerRenderer, frameState: JsObject, forHitDetection: bool, startWorld: float, endWorld: float, worldWidth: float) {.importjs: "#.renderWorlds(#, #, #, #, #)".}
proc disposeBuffers*(self: OlWebGLVectorLayerRenderer, buffers: JsObject) {.importjs: "#.disposeBuffers(#)".}
proc renderDeclutter*(self: OlWebGLVectorLayerRenderer) {.importjs: "#.renderDeclutter()".}

proc getUniforms*(): JsObject {.importjs: "(olNs_renderer_webgl_VectorLayer.Uniforms)".}
