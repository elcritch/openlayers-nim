import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_Executor from 'ol/render/canvas/Executor.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_Executor)".}

type
  OlExecutor* = ref object of JsRoot
proc newOlExecutor*(resolution: float, pixelRatio: float, overlaps: bool, instructions: JsObject, deferredRendering: JsObject = jsUndefined): OlExecutor {.importjs: "(new olNs_render_canvas_Executor.default(#, #, #, #, #))".}
proc getZIndexContext*(self: OlExecutor): JsObject {.importjs: "#.getZIndexContext()".}
proc createLabel*(self: OlExecutor, text: JsObject, textKey: cstring, fillKey: cstring, strokeKey: cstring): JsObject {.importjs: "#.createLabel(#, #, #, #)".}
proc replayTextBackground*(self: OlExecutor, context: JsObject, p1: JsObject, p2: JsObject, p3: JsObject, p4: JsObject, fillInstruction: JsObject, strokeInstruction: JsObject) {.importjs: "#.replayTextBackground_(#, #, #, #, #, #, #)".}
proc execute*(self: OlExecutor, context: JsObject, scaledCanvasSize: JsObject, transform: JsObject, viewRotation: float, snapToPixel: bool, declutterTree: JsObject = jsUndefined) {.importjs: "#.execute(#, #, #, #, #, #)".}
proc executeHitDetection*(self: OlExecutor, context: JsObject, transform: JsObject, viewRotation: float, featureCallback: JsObject = jsUndefined, hitExtent: JsObject = jsUndefined): JsObject {.importjs: "#.executeHitDetection(#, #, #, #, #)".}
