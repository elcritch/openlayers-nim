import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_ScaleLine from 'ol/control/ScaleLine.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_ScaleLine)".}

type
  OlScaleLine* = ref object of JsRoot
proc newOlScaleLine*(options: JsObject = jsUndefined): OlScaleLine {.importjs: "(new olNs_control_ScaleLine.default(#))".}
proc getUnits*(self: OlScaleLine): JsObject {.importjs: "#.getUnits()".}
proc setUnits*(self: OlScaleLine, units: JsObject) {.importjs: "#.setUnits(#)".}
proc setDpi*(self: OlScaleLine, dpi: float) {.importjs: "#.setDpi(#)".}
proc createMarker*(self: OlScaleLine, position: JsObject): cstring {.importjs: "#.createMarker(#)".}
proc createStepText*(self: OlScaleLine, i: float, width: float, isLast: bool, scale: float, suffix: cstring): cstring {.importjs: "#.createStepText(#, #, #, #, #)".}
proc getScaleForResolution*(self: OlScaleLine): float {.importjs: "#.getScaleForResolution()".}
