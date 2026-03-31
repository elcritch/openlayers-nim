import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_PointsLayer from 'ol/renderer/webgl/PointsLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_PointsLayer)".}

type
  WebGLPointsLayerRenderer* = ref object of JsRoot
proc newWebGLPointsLayerRenderer*(layer: JsObject, options: JsObject): WebGLPointsLayerRenderer {.importjs: "(new olNs_renderer_webgl_PointsLayer.default(#, #))".}
proc renderWorlds*(self: WebGLPointsLayerRenderer, frameState: JsObject, forHitDetection: bool, startWorld: float, endWorld: float, worldWidth: float) {.importjs: "#.renderWorlds(#, #, #, #, #)".}
proc renderDeclutter*(self: WebGLPointsLayerRenderer) {.importjs: "#.renderDeclutter()".}

type
  WebGLPointsLayerRendererOptions* = ref object of JsRoot

proc newWebGLPointsLayerRendererOptions*(): WebGLPointsLayerRendererOptions {.importjs: "({})".}
proc `className=`*(options: WebGLPointsLayerRendererOptions, value: cstring) {.importjs: "#.className = #".}
proc `attributes=`*(options: WebGLPointsLayerRendererOptions, value: JsObject) {.importjs: "#.attributes = #".}
proc `attributes=`*(options: WebGLPointsLayerRendererOptions, value: RootRef) {.importjs: "#.attributes = #".}
proc `attributes=`*[T](options: WebGLPointsLayerRendererOptions, value: seq[T]) {.importjs: "#.attributes = #".}
proc `vertexShader=`*(options: WebGLPointsLayerRendererOptions, value: cstring) {.importjs: "#.vertexShader = #".}
proc `fragmentShader=`*(options: WebGLPointsLayerRendererOptions, value: cstring) {.importjs: "#.fragmentShader = #".}
proc `hitDetectionEnabled=`*(options: WebGLPointsLayerRendererOptions, value: bool) {.importjs: "#.hitDetectionEnabled = #".}
proc `uniforms=`*(options: WebGLPointsLayerRendererOptions, value: JsObject) {.importjs: "#.uniforms = #".}
proc `uniforms=`*(options: WebGLPointsLayerRendererOptions, value: RootRef) {.importjs: "#.uniforms = #".}
proc `postProcesses=`*(options: WebGLPointsLayerRendererOptions, value: JsObject) {.importjs: "#.postProcesses = #".}
proc `postProcesses=`*(options: WebGLPointsLayerRendererOptions, value: RootRef) {.importjs: "#.postProcesses = #".}
proc `postProcesses=`*[T](options: WebGLPointsLayerRendererOptions, value: seq[T]) {.importjs: "#.postProcesses = #".}

proc newWebGLPointsLayerRenderer*(options: WebGLPointsLayerRendererOptions): WebGLPointsLayerRenderer {.importjs: "(new olNs_renderer_webgl_PointsLayer.default(#))".}
