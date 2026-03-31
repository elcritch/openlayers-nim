import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Draw from 'ol/interaction/Draw.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Draw)".}

type
  OlDraw* = ref object of JsRoot
proc newOlDraw*(options: JsObject): OlDraw {.importjs: "(new olNs_interaction_Draw.default(#))".}
proc setTrace*(self: OlDraw, trace: JsObject) {.importjs: "#.setTrace(#)".}
proc setFreehand*(self: OlDraw, freehand: bool) {.importjs: "#.setFreehand(#)".}
proc getOverlay*(self: OlDraw): JsObject {.importjs: "#.getOverlay()".}
proc getFreehand*(self: OlDraw): bool {.importjs: "#.getFreehand()".}
proc removeLastPoints*(self: OlDraw, n: float) {.importjs: "#.removeLastPoints_(#)".}
proc removeLastPoint*(self: OlDraw) {.importjs: "#.removeLastPoint()".}
proc finishDrawing*(self: OlDraw): JsObject {.importjs: "#.finishDrawing()".}
proc abortDrawing*(self: OlDraw) {.importjs: "#.abortDrawing()".}
proc appendCoordinates*(self: OlDraw, coordinates: JsObject) {.importjs: "#.appendCoordinates(#)".}
proc extend*(self: OlDraw, feature: JsObject) {.importjs: "#.extend(#)".}

proc createRegularPolygon*(sides: JsObject = jsUndefined, angle: JsObject = jsUndefined): JsObject {.importjs: "olNs_interaction_Draw.createRegularPolygon(#, #)".}
proc createBox*(): JsObject {.importjs: "olNs_interaction_Draw.createBox()".}
