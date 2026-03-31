import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Stroke from 'ol/style/Stroke.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Stroke)".}

type
  OlStroke* = ref object of JsRoot
proc newOlStroke*(options: JsObject = jsUndefined): OlStroke {.importjs: "(new olNs_style_Stroke.default(#))".}
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
proc setLineDashOffset*(self: OlStroke, lineDashOffset: float) {.importjs: "#.setLineDashOffset(#)".}
proc setLineJoin*(self: OlStroke, lineJoin: JsObject) {.importjs: "#.setLineJoin(#)".}
proc setMiterLimit*(self: OlStroke, miterLimit: float) {.importjs: "#.setMiterLimit(#)".}
proc setOffset*(self: OlStroke, offset: float) {.importjs: "#.setOffset(#)".}
proc setWidth*(self: OlStroke, width: float) {.importjs: "#.setWidth(#)".}
