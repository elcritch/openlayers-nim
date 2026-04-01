import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_renderer_canvas_ImageLayer from 'ol/renderer/canvas/ImageLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_ImageLayer)".}

type
  CanvasImageLayerRenderer* = ref object of JsRoot
proc newCanvasImageLayerRenderer*(imageLayer: JsObject): CanvasImageLayerRenderer {.importjs: "(new olNs_renderer_canvas_ImageLayer.default(#))".}
proc getImage*(self: CanvasImageLayerRenderer): JsObject {.importjs: "#.getImage()".}
