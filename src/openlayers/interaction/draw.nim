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

type
  DrawOptions* = ref object of JsRoot

proc newDrawOptions*(): DrawOptions {.importjs: "({})".}
proc `typeVal=`*(options: DrawOptions, value: JsObject) {.importjs: "#.type = #".}
proc `typeVal=`*(options: DrawOptions, value: RootRef) {.importjs: "#.type = #".}
proc `clickTolerance=`*(options: DrawOptions, value: float) {.importjs: "#.clickTolerance = #".}
proc `features=`*(options: DrawOptions, value: JsObject) {.importjs: "#.features = #".}
proc `features=`*(options: DrawOptions, value: RootRef) {.importjs: "#.features = #".}
proc `source=`*(options: DrawOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: DrawOptions, value: RootRef) {.importjs: "#.source = #".}
proc `dragVertexDelay=`*(options: DrawOptions, value: float) {.importjs: "#.dragVertexDelay = #".}
proc `snapTolerance=`*(options: DrawOptions, value: float) {.importjs: "#.snapTolerance = #".}
proc `stopClick=`*(options: DrawOptions, value: bool) {.importjs: "#.stopClick = #".}
proc `maxPoints=`*(options: DrawOptions, value: float) {.importjs: "#.maxPoints = #".}
proc `minPoints=`*(options: DrawOptions, value: float) {.importjs: "#.minPoints = #".}
proc `finishCondition=`*(options: DrawOptions, value: JsObject) {.importjs: "#.finishCondition = #".}
proc `finishCondition=`*(options: DrawOptions, value: RootRef) {.importjs: "#.finishCondition = #".}
proc `style=`*(options: DrawOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: DrawOptions, value: RootRef) {.importjs: "#.style = #".}
proc `geometryFunction=`*(options: DrawOptions, value: JsObject) {.importjs: "#.geometryFunction = #".}
proc `geometryFunction=`*(options: DrawOptions, value: RootRef) {.importjs: "#.geometryFunction = #".}
proc `geometryName=`*(options: DrawOptions, value: cstring) {.importjs: "#.geometryName = #".}
proc `condition=`*(options: DrawOptions, value: JsObject) {.importjs: "#.condition = #".}
proc `condition=`*(options: DrawOptions, value: RootRef) {.importjs: "#.condition = #".}
proc `freehand=`*(options: DrawOptions, value: bool) {.importjs: "#.freehand = #".}
proc `freehandCondition=`*(options: DrawOptions, value: JsObject) {.importjs: "#.freehandCondition = #".}
proc `freehandCondition=`*(options: DrawOptions, value: RootRef) {.importjs: "#.freehandCondition = #".}
proc `trace=`*(options: DrawOptions, value: bool) {.importjs: "#.trace = #".}
proc `trace=`*(options: DrawOptions, value: JsObject) {.importjs: "#.trace = #".}
proc `trace=`*(options: DrawOptions, value: RootRef) {.importjs: "#.trace = #".}
proc `traceSource=`*(options: DrawOptions, value: JsObject) {.importjs: "#.traceSource = #".}
proc `traceSource=`*(options: DrawOptions, value: RootRef) {.importjs: "#.traceSource = #".}
proc `wrapX=`*(options: DrawOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `geometryLayout=`*(options: DrawOptions, value: JsObject) {.importjs: "#.geometryLayout = #".}
proc `geometryLayout=`*(options: DrawOptions, value: RootRef) {.importjs: "#.geometryLayout = #".}

proc newDraw*(options: DrawOptions): Draw {.importjs: "(new olNs_interaction_Draw.default(#))".}
