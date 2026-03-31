import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_LineStringBuilder from 'ol/render/canvas/LineStringBuilder.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_LineStringBuilder)".}

type
  OlCanvasLineStringBuilder* = ref object of JsRoot
proc newOlCanvasLineStringBuilder*(): OlCanvasLineStringBuilder {.importjs: "(new olNs_render_canvas_LineStringBuilder.default())".}
