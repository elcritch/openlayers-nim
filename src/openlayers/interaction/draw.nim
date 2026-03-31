import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Draw from 'ol/interaction/Draw.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Draw)".}

type
  Draw* = ref object of JsRoot
proc newDraw*(options: JsObject): Draw {.importjs: "(new olNs_interaction_Draw.default(#))".}
proc setTrace*(self: Draw, trace: JsObject) {.importjs: "#.setTrace(#)".}
proc setFreehand*(self: Draw, freehand: bool) {.importjs: "#.setFreehand(#)".}
proc getOverlay*(self: Draw): JsObject {.importjs: "#.getOverlay()".}
proc getFreehand*(self: Draw): bool {.importjs: "#.getFreehand()".}
proc removeLastPoints*(self: Draw, n: float) {.importjs: "#.removeLastPoints_(#)".}
proc removeLastPoint*(self: Draw) {.importjs: "#.removeLastPoint()".}
proc finishDrawing*(self: Draw): JsObject {.importjs: "#.finishDrawing()".}
proc abortDrawing*(self: Draw) {.importjs: "#.abortDrawing()".}
proc appendCoordinates*(self: Draw, coordinates: JsObject) {.importjs: "#.appendCoordinates(#)".}
proc extend*(self: Draw, feature: JsObject) {.importjs: "#.extend(#)".}

proc createRegularPolygon*(sides: JsObject = jsUndefined, angle: JsObject = jsUndefined): JsObject {.importjs: "olNs_interaction_Draw.createRegularPolygon(#, #)".}
proc createBox*(): JsObject {.importjs: "olNs_interaction_Draw.createBox()".}
