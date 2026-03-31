import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_ScaleLine from 'ol/control/ScaleLine.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_ScaleLine)".}

type
  ScaleLine* = ref object of JsRoot
proc newScaleLine*(options: JsObject = jsUndefined): ScaleLine {.importjs: "(new olNs_control_ScaleLine.default(#))".}
proc getUnits*(self: ScaleLine): JsObject {.importjs: "#.getUnits()".}
proc setUnits*(self: ScaleLine, units: JsObject) {.importjs: "#.setUnits(#)".}
proc setDpi*(self: ScaleLine, dpi: float) {.importjs: "#.setDpi(#)".}
proc createMarker*(self: ScaleLine, position: JsObject): cstring {.importjs: "#.createMarker(#)".}
proc createStepText*(self: ScaleLine, i: float, width: float, isLast: bool, scale: float, suffix: cstring): cstring {.importjs: "#.createStepText(#, #, #, #, #)".}
proc getScaleForResolution*(self: ScaleLine): float {.importjs: "#.getScaleForResolution()".}
