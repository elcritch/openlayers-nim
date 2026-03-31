import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas from 'ol/render/canvas.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas)".}

proc measureTextWidth*(font: cstring, text: cstring): float {.importjs: "olNs_render_canvas.measureTextWidth(#, #)".}
proc measureAndCacheTextWidth*(font: cstring, text: cstring, cache: JsObject): float {.importjs: "olNs_render_canvas.measureAndCacheTextWidth(#, #, #)".}
proc getTextDimensions*(baseStyle: JsObject, chunks: seq[cstring]): JsObject {.importjs: "olNs_render_canvas.getTextDimensions(#, #)".}
proc rotateAtOffset*(context: JsObject, rotation: float, offsetX: float, offsetY: float) {.importjs: "olNs_render_canvas.rotateAtOffset(#, #, #, #)".}
proc drawImageOrLabel*(context: JsObject, transform: JsObject, opacity: float, labelOrImage: JsObject, originX: float, originY: float, w: float, h: float, x: float, y: float, scale: JsObject) {.importjs: "olNs_render_canvas.drawImageOrLabel(#, #, #, #, #, #, #, #, #, #, #)".}
proc registerFont*(fontSpec: JsObject): JsObject {.importjs: "olNs_render_canvas.registerFont(#)".}
proc measureTextHeight*(fontSpec: JsObject): float {.importjs: "olNs_render_canvas.measureTextHeight(#)".}

proc getDefaultFont*(): cstring {.importjs: "(olNs_render_canvas.defaultFont)".}
proc getDefaultFillStyle*(): cstring {.importjs: "(olNs_render_canvas.defaultFillStyle)".}
proc getDefaultLineCap*(): JsObject {.importjs: "(olNs_render_canvas.defaultLineCap)".}
proc getDefaultLineDash*(): seq[float] {.importjs: "(olNs_render_canvas.defaultLineDash)".}
proc getDefaultLineDashOffset*(): float {.importjs: "(olNs_render_canvas.defaultLineDashOffset)".}
proc getDefaultLineJoin*(): JsObject {.importjs: "(olNs_render_canvas.defaultLineJoin)".}
proc getDefaultMiterLimit*(): float {.importjs: "(olNs_render_canvas.defaultMiterLimit)".}
proc getDefaultStrokeOffset*(): float {.importjs: "(olNs_render_canvas.defaultStrokeOffset)".}
proc getDefaultStrokeStyle*(): JsObject {.importjs: "(olNs_render_canvas.defaultStrokeStyle)".}
proc getDefaultTextAlign*(): JsObject {.importjs: "(olNs_render_canvas.defaultTextAlign)".}
proc getDefaultTextBaseline*(): JsObject {.importjs: "(olNs_render_canvas.defaultTextBaseline)".}
proc getDefaultPadding*(): seq[float] {.importjs: "(olNs_render_canvas.defaultPadding)".}
proc getDefaultLineWidth*(): float {.importjs: "(olNs_render_canvas.defaultLineWidth)".}
proc getCheckedFonts*(): JsObject {.importjs: "(olNs_render_canvas.checkedFonts)".}
proc getTextHeights*(): JsObject {.importjs: "(olNs_render_canvas.textHeights)".}
