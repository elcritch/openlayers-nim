import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olNs_renderer_canvas_VectorLayer from 'ol/renderer/canvas/VectorLayer.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_VectorLayer)".}

type CanvasVectorLayerRenderer* = ref object of JsRoot
proc newCanvasVectorLayerRenderer*(
  vectorLayer: JsObject
): CanvasVectorLayerRenderer {.
  importjs: "(new olNs_renderer_canvas_VectorLayer.default(#))"
.}

proc renderWorlds*(
  self: CanvasVectorLayerRenderer,
  executorGroup: JsObject,
  frameState: JsObject,
  declutterable: JsObject = jsUndefined,
) {.importjs: "#.renderWorlds(#, #, #)".}

proc renderDeclutter*(
  self: CanvasVectorLayerRenderer, frameState: JsObject
) {.importjs: "#.renderDeclutter(#)".}

proc renderFeature*(
  self: CanvasVectorLayerRenderer,
  feature: JsObject,
  squaredTolerance: float,
  styles: JsObject,
  builderGroup: JsObject,
  transform: JsObject = jsUndefined,
  declutter: JsObject = jsUndefined,
  index: JsObject = jsUndefined,
): bool {.importjs: "#.renderFeature(#, #, #, #, #, #, #)".}
