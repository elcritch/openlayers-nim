import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_PointsLayer from 'ol/renderer/webgl/PointsLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_PointsLayer)".}

type
  OlWebGLPointsLayerRenderer* = ref object of JsRoot
proc newOlWebGLPointsLayerRenderer*(layer: JsObject, options: JsObject): OlWebGLPointsLayerRenderer {.importjs: "(new olNs_renderer_webgl_PointsLayer.default(#, #))".}
proc renderWorlds*(self: OlWebGLPointsLayerRenderer, frameState: JsObject, forHitDetection: bool, startWorld: float, endWorld: float, worldWidth: float) {.importjs: "#.renderWorlds(#, #, #, #, #)".}
proc renderDeclutter*(self: OlWebGLPointsLayerRenderer) {.importjs: "#.renderDeclutter()".}
