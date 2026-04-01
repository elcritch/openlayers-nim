import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_color from 'ol/color.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_color)".}

proc asString*(color: JsObject): cstring {.importjs: "olNs_color.asString(#)".}
proc withAlpha*(color: JsObject): JsObject {.importjs: "olNs_color.withAlpha(#)".}
proc rgbaToLcha*(color: JsObject): JsObject {.importjs: "olNs_color.rgbaToLcha(#)".}
proc lchaToRgba*(color: JsObject): JsObject {.importjs: "olNs_color.lchaToRgba(#)".}
proc fromString*(s: cstring): JsObject {.importjs: "olNs_color.fromString(#)".}
proc asArray*(color: JsObject): JsObject {.importjs: "olNs_color.asArray(#)".}
proc toString*(color: JsObject): cstring {.importjs: "olNs_color.toString(#)".}
proc isStringColor*(s: cstring): bool {.importjs: "olNs_color.isStringColor(#)".}

proc getNO_COLOR*(): JsObject {.importjs: "(olNs_color.NO_COLOR)".}
