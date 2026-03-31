import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_canvas_Layer from 'ol/renderer/canvas/Layer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_Layer)".}

type
  OlCanvasLayerRenderer* = ref object of JsRoot
proc newOlCanvasLayerRenderer*(): OlCanvasLayerRenderer {.importjs: "(new olNs_renderer_canvas_Layer.default())".}
proc getImageData*(self: OlCanvasLayerRenderer, image: JsObject, col: float, row: float): JsObject {.importjs: "#.getImageData(#, #, #)".}
proc getBackground*(self: OlCanvasLayerRenderer, frameState: JsObject): cstring {.importjs: "#.getBackground(#)".}
proc useContainer*(self: OlCanvasLayerRenderer, target: JsObject, transform: cstring, backgroundColor: JsObject = jsUndefined) {.importjs: "#.useContainer(#, #, #)".}
proc clipUnrotated*(self: OlCanvasLayerRenderer, context: JsObject, frameState: JsObject, extent: JsObject) {.importjs: "#.clipUnrotated(#, #, #)".}
proc prepareContainer*(self: OlCanvasLayerRenderer, frameState: JsObject, target: JsObject) {.importjs: "#.prepareContainer(#, #)".}
proc preRender*(self: OlCanvasLayerRenderer, context: JsObject, frameState: JsObject) {.importjs: "#.preRender(#, #)".}
proc postRender*(self: OlCanvasLayerRenderer, context: JsObject, frameState: JsObject) {.importjs: "#.postRender(#, #)".}
proc renderDeferredInternal*(self: OlCanvasLayerRenderer, frameState: JsObject) {.importjs: "#.renderDeferredInternal(#)".}
proc getRenderContext*(self: OlCanvasLayerRenderer, frameState: JsObject): JsObject {.importjs: "#.getRenderContext(#)".}
proc getRenderTransform*(self: OlCanvasLayerRenderer, center: JsObject, resolution: float, rotation: float, pixelRatio: float, width: float, height: float, offsetX: float): JsObject {.importjs: "#.getRenderTransform(#, #, #, #, #, #, #)".}

proc getCanvasPool*(): JsObject {.importjs: "(olNs_renderer_canvas_Layer.canvasPool)".}
