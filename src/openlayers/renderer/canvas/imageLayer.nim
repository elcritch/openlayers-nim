import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_canvas_ImageLayer from 'ol/renderer/canvas/ImageLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_ImageLayer)".}

type
  OlCanvasImageLayerRenderer* = ref object of JsRoot
proc newOlCanvasImageLayerRenderer*(imageLayer: JsObject): OlCanvasImageLayerRenderer {.importjs: "(new olNs_renderer_canvas_ImageLayer.default(#))".}
proc getImage*(self: OlCanvasImageLayerRenderer): JsObject {.importjs: "#.getImage()".}
