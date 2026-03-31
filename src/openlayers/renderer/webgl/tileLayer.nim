import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_TileLayer from 'ol/renderer/webgl/TileLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_TileLayer)".}

type
  OlWebGLTileLayerRenderer* = ref object of JsRoot
proc newOlWebGLTileLayerRenderer*(tileLayer: JsObject, options: JsObject): OlWebGLTileLayerRenderer {.importjs: "(new olNs_renderer_webgl_TileLayer.default(#, #))".}

proc getUniforms*(): JsObject {.importjs: "(olNs_renderer_webgl_TileLayer.Uniforms)".}
