import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_ZIndexContext from 'ol/render/canvas/ZIndexContext.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_ZIndexContext)".}

type
  OlZIndexContext* = ref object of JsRoot
proc newOlZIndexContext*(): OlZIndexContext {.importjs: "(new olNs_render_canvas_ZIndexContext.default())".}
proc pushFunction*(self: OlZIndexContext, render: JsObject) {.importjs: "#.pushFunction(#)".}
proc getContext*(self: OlZIndexContext): JsObject {.importjs: "#.getContext()".}
proc draw*(self: OlZIndexContext, context: JsObject) {.importjs: "#.draw(#)".}
proc clear*(self: OlZIndexContext) {.importjs: "#.clear()".}
proc offset*(self: OlZIndexContext) {.importjs: "#.offset()".}
