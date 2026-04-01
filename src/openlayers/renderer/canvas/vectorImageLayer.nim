import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_renderer_canvas_VectorImageLayer from 'ol/renderer/canvas/VectorImageLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_VectorImageLayer)".}

type
  CanvasVectorImageLayerRenderer* = ref object of JsRoot
proc newCanvasVectorImageLayerRenderer*(layer: JsObject): CanvasVectorImageLayerRenderer {.importjs: "(new olNs_renderer_canvas_VectorImageLayer.default(#))".}
proc renderDeclutter*(self: CanvasVectorImageLayerRenderer) {.importjs: "#.renderDeclutter()".}
