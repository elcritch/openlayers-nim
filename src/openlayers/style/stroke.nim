import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_style_Stroke from 'ol/style/Stroke.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Stroke)".}

type
  Stroke* = ref object of JsRoot
proc newStroke*(options: JsObject = jsUndefined): Stroke {.importjs: "(new olNs_style_Stroke.default(#))".}
proc clone*(self: Stroke): JsObject {.importjs: "#.clone()".}
proc getColor*(self: Stroke): JsObject {.importjs: "#.getColor()".}
proc getLineCap*(self: Stroke): JsObject {.importjs: "#.getLineCap()".}
proc getLineDash*(self: Stroke): JsObject {.importjs: "#.getLineDash()".}
proc getLineDashOffset*(self: Stroke): float {.importjs: "#.getLineDashOffset()".}
proc getLineJoin*(self: Stroke): JsObject {.importjs: "#.getLineJoin()".}
proc getMiterLimit*(self: Stroke): float {.importjs: "#.getMiterLimit()".}
proc getOffset*(self: Stroke): float {.importjs: "#.getOffset()".}
proc getWidth*(self: Stroke): float {.importjs: "#.getWidth()".}
proc setColor*(self: Stroke, color: JsObject) {.importjs: "#.setColor(#)".}
proc setLineCap*(self: Stroke, lineCap: JsObject) {.importjs: "#.setLineCap(#)".}
proc setLineDash*(self: Stroke, lineDash: JsObject) {.importjs: "#.setLineDash(#)".}
proc setLineDashOffset*(self: Stroke, lineDashOffset: float) {.importjs: "#.setLineDashOffset(#)".}
proc setLineJoin*(self: Stroke, lineJoin: JsObject) {.importjs: "#.setLineJoin(#)".}
proc setMiterLimit*(self: Stroke, miterLimit: float) {.importjs: "#.setMiterLimit(#)".}
proc setOffset*(self: Stroke, offset: float) {.importjs: "#.setOffset(#)".}
proc setWidth*(self: Stroke, width: float) {.importjs: "#.setWidth(#)".}

type
  StrokeOptions* = ref object of JsRoot

proc newStrokeOptions*(): StrokeOptions {.importjs: "({})".}
proc `color=`*(options: StrokeOptions, value: JsObject) {.importjs: "#.color = #".}
proc `color=`*(options: StrokeOptions, value: RootRef) {.importjs: "#.color = #".}
proc `color=`*(options: StrokeOptions, value: cstring) {.importjs: "#.color = #".}
proc `lineCap=`*(options: StrokeOptions, value: JsObject) {.importjs: "#.lineCap = #".}
proc `lineCap=`*(options: StrokeOptions, value: RootRef) {.importjs: "#.lineCap = #".}
proc `lineJoin=`*(options: StrokeOptions, value: JsObject) {.importjs: "#.lineJoin = #".}
proc `lineJoin=`*(options: StrokeOptions, value: RootRef) {.importjs: "#.lineJoin = #".}
proc `lineDash=`*(options: StrokeOptions, value: seq[float]) {.importjs: "#.lineDash = #".}
proc `lineDashOffset=`*(options: StrokeOptions, value: float) {.importjs: "#.lineDashOffset = #".}
proc `miterLimit=`*(options: StrokeOptions, value: float) {.importjs: "#.miterLimit = #".}
proc `offset=`*(options: StrokeOptions, value: float) {.importjs: "#.offset = #".}
proc `width=`*(options: StrokeOptions, value: float) {.importjs: "#.width = #".}

proc newStroke*(options: StrokeOptions): Stroke {.importjs: "(new olNs_style_Stroke.default(#))".}
