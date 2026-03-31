import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_canvas_VectorImageLayer from 'ol/renderer/canvas/VectorImageLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_VectorImageLayer)".}

type
  OlCanvasVectorImageLayerRenderer* = ref object of JsRoot
proc newOlCanvasVectorImageLayerRenderer*(layer: JsObject): OlCanvasVectorImageLayerRenderer {.importjs: "(new olNs_renderer_canvas_VectorImageLayer.default(#))".}
proc renderDeclutter*(self: OlCanvasVectorImageLayerRenderer) {.importjs: "#.renderDeclutter()".}
