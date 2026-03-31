import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_canvas_VectorTileLayer from 'ol/renderer/canvas/VectorTileLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_VectorTileLayer)".}

type
  OlCanvasVectorTileLayerRenderer* = ref object of JsRoot
proc newOlCanvasVectorTileLayerRenderer*(layer: JsObject, options: JsObject): OlCanvasVectorTileLayerRenderer {.importjs: "(new olNs_renderer_canvas_VectorTileLayer.default(#, #))".}
proc getFeaturesInExtent*(self: OlCanvasVectorTileLayerRenderer, extent: JsObject): JsObject {.importjs: "#.getFeaturesInExtent(#)".}
proc renderDeclutter*(self: OlCanvasVectorTileLayerRenderer, frameState: JsObject, layerState: JsObject) {.importjs: "#.renderDeclutter(#, #)".}
proc getTileRenderTransform*(self: OlCanvasVectorTileLayerRenderer, tile: JsObject, frameState: JsObject): JsObject {.importjs: "#.getTileRenderTransform(#, #)".}
proc renderFeature*(self: OlCanvasVectorTileLayerRenderer, feature: JsObject, squaredTolerance: float, styles: JsObject, builderGroup: JsObject, declutter: JsObject = jsUndefined, index: JsObject = jsUndefined): bool {.importjs: "#.renderFeature(#, #, #, #, #, #)".}
