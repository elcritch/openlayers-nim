import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_Immediate from 'ol/render/canvas/Immediate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_Immediate)".}

type
  OlCanvasImmediateRenderer* = ref object of JsRoot
proc newOlCanvasImmediateRenderer*(context: JsObject, pixelRatio: float, extent: JsObject, transform: JsObject, viewRotation: float, squaredTolerance: JsObject = jsUndefined, userTransform: JsObject = jsUndefined): OlCanvasImmediateRenderer {.importjs: "(new olNs_render_canvas_Immediate.default(#, #, #, #, #, #, #))".}
proc setTransform*(self: OlCanvasImmediateRenderer, transform: JsObject) {.importjs: "#.setTransform(#)".}
