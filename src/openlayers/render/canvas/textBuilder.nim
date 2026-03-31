import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_TextBuilder from 'ol/render/canvas/TextBuilder.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_TextBuilder)".}

type
  OlCanvasTextBuilder* = ref object of JsRoot
proc newOlCanvasTextBuilder*(): OlCanvasTextBuilder {.importjs: "(new olNs_render_canvas_TextBuilder.default())".}

proc getTEXT_ALIGN*(): JsObject {.importjs: "(olNs_render_canvas_TextBuilder.TEXT_ALIGN)".}
