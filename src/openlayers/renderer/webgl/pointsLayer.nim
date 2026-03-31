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
