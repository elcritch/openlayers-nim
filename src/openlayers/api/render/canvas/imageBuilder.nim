import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_ImageBuilder from 'ol/render/canvas/ImageBuilder.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_ImageBuilder)".}

type
  OlCanvasImageBuilder* = ref object of JsRoot
proc newOlCanvasImageBuilder*(): OlCanvasImageBuilder {.importjs: "(new olNs_render_canvas_ImageBuilder.default())".}
