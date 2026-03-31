import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Circle from 'ol/style/Circle.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Circle)".}

type
  CircleStyle* = ref object of JsRoot
proc newCircleStyle*(options: JsObject = jsUndefined): CircleStyle {.importjs: "(new olNs_style_Circle.default(#))".}
