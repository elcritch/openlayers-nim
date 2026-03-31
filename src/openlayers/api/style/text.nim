import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Text from 'ol/style/Text.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Text)".}

type
  OlText* = ref object of JsRoot
proc newOlText*(options: JsObject = jsUndefined): OlText {.importjs: "(new olNs_style_Text.default(#))".}
proc clone*(self: OlText): JsObject {.importjs: "#.clone()".}
proc getOverflow*(self: OlText): bool {.importjs: "#.getOverflow()".}
proc getFont*(self: OlText): cstring {.importjs: "#.getFont()".}
proc getMaxAngle*(self: OlText): float {.importjs: "#.getMaxAngle()".}
proc getPlacement*(self: OlText): JsObject {.importjs: "#.getPlacement()".}
proc getRepeat*(self: OlText): float {.importjs: "#.getRepeat()".}
proc getOffsetX*(self: OlText): float {.importjs: "#.getOffsetX()".}
proc getOffsetY*(self: OlText): float {.importjs: "#.getOffsetY()".}
proc getFill*(self: OlText): JsObject {.importjs: "#.getFill()".}
proc getRotateWithView*(self: OlText): bool {.importjs: "#.getRotateWithView()".}
proc getKeepUpright*(self: OlText): bool {.importjs: "#.getKeepUpright()".}
proc getRotation*(self: OlText): float {.importjs: "#.getRotation()".}
proc getScale*(self: OlText): JsObject {.importjs: "#.getScale()".}
proc getScaleArray*(self: OlText): JsObject {.importjs: "#.getScaleArray()".}
proc getStroke*(self: OlText): JsObject {.importjs: "#.getStroke()".}
proc getText*(self: OlText): JsObject {.importjs: "#.getText()".}
proc getTextAlign*(self: OlText): JsObject {.importjs: "#.getTextAlign()".}
proc getJustify*(self: OlText): JsObject {.importjs: "#.getJustify()".}
proc getTextBaseline*(self: OlText): JsObject {.importjs: "#.getTextBaseline()".}
proc getBackgroundFill*(self: OlText): JsObject {.importjs: "#.getBackgroundFill()".}
proc getBackgroundStroke*(self: OlText): JsObject {.importjs: "#.getBackgroundStroke()".}
proc getPadding*(self: OlText): JsObject {.importjs: "#.getPadding()".}
proc getDeclutterMode*(self: OlText): JsObject {.importjs: "#.getDeclutterMode()".}
proc setOverflow*(self: OlText, overflow: bool) {.importjs: "#.setOverflow(#)".}
proc setFont*(self: OlText, font: cstring) {.importjs: "#.setFont(#)".}
proc setMaxAngle*(self: OlText, maxAngle: float) {.importjs: "#.setMaxAngle(#)".}
proc setOffsetX*(self: OlText, offsetX: float) {.importjs: "#.setOffsetX(#)".}
proc setOffsetY*(self: OlText, offsetY: float) {.importjs: "#.setOffsetY(#)".}
proc setPlacement*(self: OlText, placement: JsObject) {.importjs: "#.setPlacement(#)".}
proc setRepeat*(self: OlText, repeat: JsObject = jsUndefined) {.importjs: "#.setRepeat(#)".}
proc setRotateWithView*(self: OlText, rotateWithView: bool) {.importjs: "#.setRotateWithView(#)".}
proc setKeepUpright*(self: OlText, keepUpright: bool) {.importjs: "#.setKeepUpright(#)".}
proc setFill*(self: OlText, fill: JsObject) {.importjs: "#.setFill(#)".}
proc setRotation*(self: OlText, rotation: float) {.importjs: "#.setRotation(#)".}
proc setScale*(self: OlText, scale: JsObject) {.importjs: "#.setScale(#)".}
proc setStroke*(self: OlText, stroke: JsObject) {.importjs: "#.setStroke(#)".}
proc setText*(self: OlText, text: JsObject) {.importjs: "#.setText(#)".}
proc setTextAlign*(self: OlText, textAlign: JsObject) {.importjs: "#.setTextAlign(#)".}
proc setJustify*(self: OlText, justify: JsObject) {.importjs: "#.setJustify(#)".}
proc setTextBaseline*(self: OlText, textBaseline: JsObject) {.importjs: "#.setTextBaseline(#)".}
proc setBackgroundFill*(self: OlText, fill: JsObject) {.importjs: "#.setBackgroundFill(#)".}
proc setBackgroundStroke*(self: OlText, stroke: JsObject) {.importjs: "#.setBackgroundStroke(#)".}
proc setPadding*(self: OlText, padding: JsObject) {.importjs: "#.setPadding(#)".}
