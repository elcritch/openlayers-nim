import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_style from 'ol/style.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style)".}

proc getCircle*(): JsObject {.importjs: "(olNs_style.Circle)".}
proc getFill*(): JsObject {.importjs: "(olNs_style.Fill)".}
proc getIcon*(): JsObject {.importjs: "(olNs_style.Icon)".}
proc getIconImage*(): JsObject {.importjs: "(olNs_style.IconImage)".}
proc getImage*(): JsObject {.importjs: "(olNs_style.Image)".}
proc getRegularShape*(): JsObject {.importjs: "(olNs_style.RegularShape)".}
proc getStroke*(): JsObject {.importjs: "(olNs_style.Stroke)".}
proc getStyle*(): JsObject {.importjs: "(olNs_style.Style)".}
proc getText*(): JsObject {.importjs: "(olNs_style.Text)".}
