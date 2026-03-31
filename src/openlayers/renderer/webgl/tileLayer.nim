import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_TileLayer from 'ol/renderer/webgl/TileLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_TileLayer)".}

type
  WebGLTileLayerRenderer* = ref object of JsRoot
proc newWebGLTileLayerRenderer*(tileLayer: JsObject, options: JsObject): WebGLTileLayerRenderer {.importjs: "(new olNs_renderer_webgl_TileLayer.default(#, #))".}

proc getUniforms*(): JsObject {.importjs: "(olNs_renderer_webgl_TileLayer.Uniforms)".}

type
  WebGLTileLayerRendererOptions* = ref object of JsRoot

proc newWebGLTileLayerRendererOptions*(): WebGLTileLayerRendererOptions {.importjs: "({})".}
proc `vertexShader=`*(options: WebGLTileLayerRendererOptions, value: cstring) {.importjs: "#.vertexShader = #".}
proc `fragmentShader=`*(options: WebGLTileLayerRendererOptions, value: cstring) {.importjs: "#.fragmentShader = #".}
proc `uniforms=`*(options: WebGLTileLayerRendererOptions, value: JsObject) {.importjs: "#.uniforms = #".}
proc `uniforms=`*(options: WebGLTileLayerRendererOptions, value: RootRef) {.importjs: "#.uniforms = #".}
proc `paletteTextures=`*(options: WebGLTileLayerRendererOptions, value: JsObject) {.importjs: "#.paletteTextures = #".}
proc `paletteTextures=`*(options: WebGLTileLayerRendererOptions, value: RootRef) {.importjs: "#.paletteTextures = #".}
proc `paletteTextures=`*[T](options: WebGLTileLayerRendererOptions, value: seq[T]) {.importjs: "#.paletteTextures = #".}
proc `cacheSize=`*(options: WebGLTileLayerRendererOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `postProcesses=`*(options: WebGLTileLayerRendererOptions, value: JsObject) {.importjs: "#.postProcesses = #".}
proc `postProcesses=`*(options: WebGLTileLayerRendererOptions, value: RootRef) {.importjs: "#.postProcesses = #".}
proc `postProcesses=`*[T](options: WebGLTileLayerRendererOptions, value: seq[T]) {.importjs: "#.postProcesses = #".}

proc newWebGLTileLayerRenderer*(options: WebGLTileLayerRendererOptions): WebGLTileLayerRenderer {.importjs: "(new olNs_renderer_webgl_TileLayer.default(#))".}
