import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_style_RegularShape from 'ol/style/RegularShape.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_RegularShape)".}

type
  RegularShape* = ref object of JsRoot
proc newRegularShape*(options: JsObject): RegularShape {.importjs: "(new olNs_style_RegularShape.default(#))".}
proc getAngle*(self: RegularShape): float {.importjs: "#.getAngle()".}
proc getFill*(self: RegularShape): JsObject {.importjs: "#.getFill()".}
proc setFill*(self: RegularShape, fill: JsObject) {.importjs: "#.setFill(#)".}
proc getPoints*(self: RegularShape): float {.importjs: "#.getPoints()".}
proc getRadius*(self: RegularShape): float {.importjs: "#.getRadius()".}
proc setRadius*(self: RegularShape, radius: float) {.importjs: "#.setRadius(#)".}
proc getRadius2*(self: RegularShape): float {.importjs: "#.getRadius2()".}
proc setRadius2*(self: RegularShape, radius2: float) {.importjs: "#.setRadius2(#)".}
proc getStroke*(self: RegularShape): JsObject {.importjs: "#.getStroke()".}
proc setStroke*(self: RegularShape, stroke: JsObject) {.importjs: "#.setStroke(#)".}
proc createRenderOptions*(self: RegularShape): JsObject {.importjs: "#.createRenderOptions()".}
proc render*(self: RegularShape) {.importjs: "#.render()".}

type
  RegularShapeOptions* = ref object of JsRoot

proc newRegularShapeOptions*(): RegularShapeOptions {.importjs: "({})".}
proc `fill=`*(options: RegularShapeOptions, value: JsObject) {.importjs: "#.fill = #".}
proc `fill=`*(options: RegularShapeOptions, value: RootRef) {.importjs: "#.fill = #".}
proc `points=`*(options: RegularShapeOptions, value: float) {.importjs: "#.points = #".}
proc `radius=`*(options: RegularShapeOptions, value: float) {.importjs: "#.radius = #".}
proc `radius2=`*(options: RegularShapeOptions, value: float) {.importjs: "#.radius2 = #".}
proc `angle=`*(options: RegularShapeOptions, value: float) {.importjs: "#.angle = #".}
proc `displacement=`*(options: RegularShapeOptions, value: seq[float]) {.importjs: "#.displacement = #".}
proc `stroke=`*(options: RegularShapeOptions, value: JsObject) {.importjs: "#.stroke = #".}
proc `stroke=`*(options: RegularShapeOptions, value: RootRef) {.importjs: "#.stroke = #".}
proc `rotation=`*(options: RegularShapeOptions, value: float) {.importjs: "#.rotation = #".}
proc `rotateWithView=`*(options: RegularShapeOptions, value: bool) {.importjs: "#.rotateWithView = #".}
proc `scale=`*(options: RegularShapeOptions, value: float) {.importjs: "#.scale = #".}
proc `scale=`*(options: RegularShapeOptions, value: JsObject) {.importjs: "#.scale = #".}
proc `scale=`*(options: RegularShapeOptions, value: RootRef) {.importjs: "#.scale = #".}
proc `declutterMode=`*(options: RegularShapeOptions, value: JsObject) {.importjs: "#.declutterMode = #".}
proc `declutterMode=`*(options: RegularShapeOptions, value: RootRef) {.importjs: "#.declutterMode = #".}

proc newRegularShape*(options: RegularShapeOptions): RegularShape {.importjs: "(new olNs_style_RegularShape.default(#))".}

type
  RenderOptions* = ref object of JsRoot

proc newRenderOptions*(): RenderOptions {.importjs: "({})".}
proc `strokeStyle=`*(options: RenderOptions, value: JsObject) {.importjs: "#.strokeStyle = #".}
proc `strokeStyle=`*(options: RenderOptions, value: RootRef) {.importjs: "#.strokeStyle = #".}
proc `strokeStyle=`*(options: RenderOptions, value: cstring) {.importjs: "#.strokeStyle = #".}
proc `strokeWidth=`*(options: RenderOptions, value: float) {.importjs: "#.strokeWidth = #".}
proc `size=`*(options: RenderOptions, value: float) {.importjs: "#.size = #".}
proc `lineCap=`*(options: RenderOptions, value: JsObject) {.importjs: "#.lineCap = #".}
proc `lineCap=`*(options: RenderOptions, value: RootRef) {.importjs: "#.lineCap = #".}
proc `lineDash=`*(options: RenderOptions, value: seq[float]) {.importjs: "#.lineDash = #".}
proc `lineDashOffset=`*(options: RenderOptions, value: float) {.importjs: "#.lineDashOffset = #".}
proc `lineJoin=`*(options: RenderOptions, value: JsObject) {.importjs: "#.lineJoin = #".}
proc `lineJoin=`*(options: RenderOptions, value: RootRef) {.importjs: "#.lineJoin = #".}
proc `miterLimit=`*(options: RenderOptions, value: float) {.importjs: "#.miterLimit = #".}
