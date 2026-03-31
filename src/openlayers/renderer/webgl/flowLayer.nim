import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_FlowLayer from 'ol/renderer/webgl/FlowLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_FlowLayer)".}

type
  OlFlowLayerRenderer* = ref object of JsRoot
proc newOlFlowLayerRenderer*(layer: JsObject, options: JsObject): OlFlowLayerRenderer {.importjs: "(new olNs_renderer_webgl_FlowLayer.default(#, #))".}
proc createSizeDependentTextures*(self: OlFlowLayerRenderer) {.importjs: "#.createSizeDependentTextures_()".}
proc drawParticleTrails*(self: OlFlowLayerRenderer, frameState: JsObject) {.importjs: "#.drawParticleTrails_(#)".}
proc drawTexture*(self: OlFlowLayerRenderer, texture: JsObject, opacity: float) {.importjs: "#.drawTexture_(#, #)".}
proc drawParticleColor*(self: OlFlowLayerRenderer, frameState: JsObject) {.importjs: "#.drawParticleColor_(#)".}
proc updateParticlePositions*(self: OlFlowLayerRenderer, frameState: JsObject) {.importjs: "#.updateParticlePositions_(#)".}
