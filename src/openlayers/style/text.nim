import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Text from 'ol/style/Text.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Text)".}

type
  Text* = ref object of JsRoot
proc newText*(options: JsObject = jsUndefined): Text {.importjs: "(new olNs_style_Text.default(#))".}
proc clone*(self: Text): JsObject {.importjs: "#.clone()".}
proc getOverflow*(self: Text): bool {.importjs: "#.getOverflow()".}
proc getFont*(self: Text): cstring {.importjs: "#.getFont()".}
proc getMaxAngle*(self: Text): float {.importjs: "#.getMaxAngle()".}
proc getPlacement*(self: Text): JsObject {.importjs: "#.getPlacement()".}
proc getRepeat*(self: Text): float {.importjs: "#.getRepeat()".}
proc getOffsetX*(self: Text): float {.importjs: "#.getOffsetX()".}
proc getOffsetY*(self: Text): float {.importjs: "#.getOffsetY()".}
proc getFill*(self: Text): JsObject {.importjs: "#.getFill()".}
proc getRotateWithView*(self: Text): bool {.importjs: "#.getRotateWithView()".}
proc getKeepUpright*(self: Text): bool {.importjs: "#.getKeepUpright()".}
proc getRotation*(self: Text): float {.importjs: "#.getRotation()".}
proc getScale*(self: Text): JsObject {.importjs: "#.getScale()".}
proc getScaleArray*(self: Text): JsObject {.importjs: "#.getScaleArray()".}
proc getStroke*(self: Text): JsObject {.importjs: "#.getStroke()".}
proc getText*(self: Text): JsObject {.importjs: "#.getText()".}
proc getTextAlign*(self: Text): JsObject {.importjs: "#.getTextAlign()".}
proc getJustify*(self: Text): JsObject {.importjs: "#.getJustify()".}
proc getTextBaseline*(self: Text): JsObject {.importjs: "#.getTextBaseline()".}
proc getBackgroundFill*(self: Text): JsObject {.importjs: "#.getBackgroundFill()".}
proc getBackgroundStroke*(self: Text): JsObject {.importjs: "#.getBackgroundStroke()".}
proc getPadding*(self: Text): JsObject {.importjs: "#.getPadding()".}
proc getDeclutterMode*(self: Text): JsObject {.importjs: "#.getDeclutterMode()".}
proc setOverflow*(self: Text, overflow: bool) {.importjs: "#.setOverflow(#)".}
proc setFont*(self: Text, font: cstring) {.importjs: "#.setFont(#)".}
proc setMaxAngle*(self: Text, maxAngle: float) {.importjs: "#.setMaxAngle(#)".}
proc setOffsetX*(self: Text, offsetX: float) {.importjs: "#.setOffsetX(#)".}
proc setOffsetY*(self: Text, offsetY: float) {.importjs: "#.setOffsetY(#)".}
proc setPlacement*(self: Text, placement: JsObject) {.importjs: "#.setPlacement(#)".}
proc setRepeat*(self: Text, repeat: JsObject = jsUndefined) {.importjs: "#.setRepeat(#)".}
proc setRotateWithView*(self: Text, rotateWithView: bool) {.importjs: "#.setRotateWithView(#)".}
proc setKeepUpright*(self: Text, keepUpright: bool) {.importjs: "#.setKeepUpright(#)".}
proc setFill*(self: Text, fill: JsObject) {.importjs: "#.setFill(#)".}
proc setRotation*(self: Text, rotation: float) {.importjs: "#.setRotation(#)".}
proc setScale*(self: Text, scale: JsObject) {.importjs: "#.setScale(#)".}
proc setStroke*(self: Text, stroke: JsObject) {.importjs: "#.setStroke(#)".}
proc setText*(self: Text, text: JsObject) {.importjs: "#.setText(#)".}
proc setTextAlign*(self: Text, textAlign: JsObject) {.importjs: "#.setTextAlign(#)".}
proc setJustify*(self: Text, justify: JsObject) {.importjs: "#.setJustify(#)".}
proc setTextBaseline*(self: Text, textBaseline: JsObject) {.importjs: "#.setTextBaseline(#)".}
proc setBackgroundFill*(self: Text, fill: JsObject) {.importjs: "#.setBackgroundFill(#)".}
proc setBackgroundStroke*(self: Text, stroke: JsObject) {.importjs: "#.setBackgroundStroke(#)".}
proc setPadding*(self: Text, padding: JsObject) {.importjs: "#.setPadding(#)".}

type
  TextOptions* = ref object of JsRoot

proc newTextOptions*(): TextOptions {.importjs: "({})".}
proc `font=`*(options: TextOptions, value: cstring) {.importjs: "#.font = #".}
proc `maxAngle=`*(options: TextOptions, value: float) {.importjs: "#.maxAngle = #".}
proc `offsetX=`*(options: TextOptions, value: float) {.importjs: "#.offsetX = #".}
proc `offsetY=`*(options: TextOptions, value: float) {.importjs: "#.offsetY = #".}
proc `overflow=`*(options: TextOptions, value: bool) {.importjs: "#.overflow = #".}
proc `placement=`*(options: TextOptions, value: JsObject) {.importjs: "#.placement = #".}
proc `placement=`*(options: TextOptions, value: RootRef) {.importjs: "#.placement = #".}
proc `repeat=`*(options: TextOptions, value: float) {.importjs: "#.repeat = #".}
proc `scale=`*(options: TextOptions, value: float) {.importjs: "#.scale = #".}
proc `scale=`*(options: TextOptions, value: JsObject) {.importjs: "#.scale = #".}
proc `scale=`*(options: TextOptions, value: RootRef) {.importjs: "#.scale = #".}
proc `rotateWithView=`*(options: TextOptions, value: bool) {.importjs: "#.rotateWithView = #".}
proc `keepUpright=`*(options: TextOptions, value: bool) {.importjs: "#.keepUpright = #".}
proc `rotation=`*(options: TextOptions, value: float) {.importjs: "#.rotation = #".}
proc `text=`*(options: TextOptions, value: cstring) {.importjs: "#.text = #".}
proc `text=`*(options: TextOptions, value: seq[cstring]) {.importjs: "#.text = #".}
proc `textAlign=`*(options: TextOptions, value: JsObject) {.importjs: "#.textAlign = #".}
proc `textAlign=`*(options: TextOptions, value: RootRef) {.importjs: "#.textAlign = #".}
proc `justify=`*(options: TextOptions, value: JsObject) {.importjs: "#.justify = #".}
proc `justify=`*(options: TextOptions, value: RootRef) {.importjs: "#.justify = #".}
proc `textBaseline=`*(options: TextOptions, value: JsObject) {.importjs: "#.textBaseline = #".}
proc `textBaseline=`*(options: TextOptions, value: RootRef) {.importjs: "#.textBaseline = #".}
proc `fill=`*(options: TextOptions, value: JsObject) {.importjs: "#.fill = #".}
proc `fill=`*(options: TextOptions, value: RootRef) {.importjs: "#.fill = #".}
proc `stroke=`*(options: TextOptions, value: JsObject) {.importjs: "#.stroke = #".}
proc `stroke=`*(options: TextOptions, value: RootRef) {.importjs: "#.stroke = #".}
proc `backgroundFill=`*(options: TextOptions, value: JsObject) {.importjs: "#.backgroundFill = #".}
proc `backgroundFill=`*(options: TextOptions, value: RootRef) {.importjs: "#.backgroundFill = #".}
proc `backgroundStroke=`*(options: TextOptions, value: JsObject) {.importjs: "#.backgroundStroke = #".}
proc `backgroundStroke=`*(options: TextOptions, value: RootRef) {.importjs: "#.backgroundStroke = #".}
proc `padding=`*(options: TextOptions, value: seq[float]) {.importjs: "#.padding = #".}
proc `declutterMode=`*(options: TextOptions, value: JsObject) {.importjs: "#.declutterMode = #".}
proc `declutterMode=`*(options: TextOptions, value: RootRef) {.importjs: "#.declutterMode = #".}

proc newText*(options: TextOptions): Text {.importjs: "(new olNs_style_Text.default(#))".}
