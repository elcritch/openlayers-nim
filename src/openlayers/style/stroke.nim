import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Stroke from 'ol/style/Stroke.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Stroke)".}

type
  OlStrokeOptions* = ref object of JsRoot
  OlStroke* = ref object of JsRoot

proc newOlStrokeOptions*(): OlStrokeOptions {.importjs: "({})".}
proc `color=`*(options: OlStrokeOptions, value: JsObject) {.importjs: "#.color = #".}
proc `color=`*(options: OlStrokeOptions, value: cstring) {.importjs: "#.color = #".}
proc `lineCap=`*(options: OlStrokeOptions, value: cstring) {.importjs: "#.lineCap = #".}
proc `lineJoin=`*(
  options: OlStrokeOptions, value: cstring
) {.importjs: "#.lineJoin = #".}

proc `lineDash=`*(
  options: OlStrokeOptions, value: seq[float]
) {.importjs: "#.lineDash = #".}

proc `lineDash=`*(
  options: OlStrokeOptions, value: JsObject
) {.importjs: "#.lineDash = #".}

proc `lineDashOffset=`*(
  options: OlStrokeOptions, value: float
) {.importjs: "#.lineDashOffset = #".}

proc `miterLimit=`*(
  options: OlStrokeOptions, value: float
) {.importjs: "#.miterLimit = #".}

proc `offset=`*(options: OlStrokeOptions, value: float) {.importjs: "#.offset = #".}
proc `width=`*(options: OlStrokeOptions, value: float) {.importjs: "#.width = #".}

proc newOlStroke*(
  options: JsObject = jsUndefined
): OlStroke {.importjs: "(new olNs_style_Stroke.default(#))".}

proc newOlStroke*(
  options: OlStrokeOptions
): OlStroke {.importjs: "(new olNs_style_Stroke.default(#))".}

proc clone*(self: OlStroke): JsObject {.importjs: "#.clone()".}
proc getColor*(self: OlStroke): JsObject {.importjs: "#.getColor()".}
proc getLineCap*(self: OlStroke): JsObject {.importjs: "#.getLineCap()".}
proc getLineDash*(self: OlStroke): JsObject {.importjs: "#.getLineDash()".}
proc getLineDashOffset*(self: OlStroke): float {.importjs: "#.getLineDashOffset()".}
proc getLineJoin*(self: OlStroke): JsObject {.importjs: "#.getLineJoin()".}
proc getMiterLimit*(self: OlStroke): float {.importjs: "#.getMiterLimit()".}
proc getOffset*(self: OlStroke): float {.importjs: "#.getOffset()".}
proc getWidth*(self: OlStroke): float {.importjs: "#.getWidth()".}
proc setColor*(self: OlStroke, color: JsObject) {.importjs: "#.setColor(#)".}
proc setLineCap*(self: OlStroke, lineCap: JsObject) {.importjs: "#.setLineCap(#)".}
proc setLineDash*(self: OlStroke, lineDash: JsObject) {.importjs: "#.setLineDash(#)".}
proc setLineDashOffset*(
  self: OlStroke, lineDashOffset: float
) {.importjs: "#.setLineDashOffset(#)".}

proc setLineJoin*(self: OlStroke, lineJoin: JsObject) {.importjs: "#.setLineJoin(#)".}
proc setMiterLimit*(
  self: OlStroke, miterLimit: float
) {.importjs: "#.setMiterLimit(#)".}

proc setOffset*(self: OlStroke, offset: float) {.importjs: "#.setOffset(#)".}
proc setWidth*(self: OlStroke, width: float) {.importjs: "#.setWidth(#)".}
