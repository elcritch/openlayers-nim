import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_render_canvas_Immediate from 'ol/render/canvas/Immediate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_Immediate)".}

type
  CanvasImmediateRenderer* = ref object of JsRoot
proc newCanvasImmediateRenderer*(context: JsObject, pixelRatio: float, extent: JsObject, transform: JsObject, viewRotation: float, squaredTolerance: JsObject = jsUndefined, userTransform: JsObject = jsUndefined): CanvasImmediateRenderer {.importjs: "(new olNs_render_canvas_Immediate.default(#, #, #, #, #, #, #))".}
proc setTransform*(self: CanvasImmediateRenderer, transform: JsObject) {.importjs: "#.setTransform(#)".}
