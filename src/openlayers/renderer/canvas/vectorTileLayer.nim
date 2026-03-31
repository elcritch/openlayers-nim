import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_canvas_VectorTileLayer from 'ol/renderer/canvas/VectorTileLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_VectorTileLayer)".}

type
  CanvasVectorTileLayerRenderer* = ref object of JsRoot
proc newCanvasVectorTileLayerRenderer*(layer: JsObject, options: JsObject): CanvasVectorTileLayerRenderer {.importjs: "(new olNs_renderer_canvas_VectorTileLayer.default(#, #))".}
proc getFeaturesInExtent*(self: CanvasVectorTileLayerRenderer, extent: JsObject): JsObject {.importjs: "#.getFeaturesInExtent(#)".}
proc renderDeclutter*(self: CanvasVectorTileLayerRenderer, frameState: JsObject, layerState: JsObject) {.importjs: "#.renderDeclutter(#, #)".}
proc getTileRenderTransform*(self: CanvasVectorTileLayerRenderer, tile: JsObject, frameState: JsObject): JsObject {.importjs: "#.getTileRenderTransform(#, #)".}
proc renderFeature*(self: CanvasVectorTileLayerRenderer, feature: JsObject, squaredTolerance: float, styles: JsObject, builderGroup: JsObject, declutter: JsObject = jsUndefined, index: JsObject = jsUndefined): bool {.importjs: "#.renderFeature(#, #, #, #, #, #)".}
