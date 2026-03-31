import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_VectorTileLayer from 'ol/renderer/webgl/VectorTileLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_VectorTileLayer)".}

type
  OlWebGLVectorTileLayerRenderer* = ref object of JsRoot
proc newOlWebGLVectorTileLayerRenderer*(tileLayer: JsObject, options: JsObject): OlWebGLVectorTileLayerRenderer {.importjs: "(new olNs_renderer_webgl_VectorTileLayer.default(#, #))".}
proc renderDeclutter*(self: OlWebGLVectorTileLayerRenderer, frameState: JsObject) {.importjs: "#.renderDeclutter(#)".}

proc getUniforms*(): JsObject {.importjs: "(olNs_renderer_webgl_VectorTileLayer.Uniforms)".}
