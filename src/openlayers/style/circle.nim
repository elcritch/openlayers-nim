import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Circle from 'ol/style/Circle.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Circle)".}

type
  OlCircleStyle* = ref object of JsRoot
proc newOlCircleStyle*(options: JsObject = jsUndefined): OlCircleStyle {.importjs: "(new olNs_style_Circle.default(#))".}
