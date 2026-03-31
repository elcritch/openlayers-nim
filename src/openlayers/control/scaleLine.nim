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

type
  ScaleLineOptions* = ref object of JsRoot

proc newScaleLineOptions*(): ScaleLineOptions {.importjs: "({})".}
proc `className=`*(options: ScaleLineOptions, value: cstring) {.importjs: "#.className = #".}
proc `minWidth=`*(options: ScaleLineOptions, value: float) {.importjs: "#.minWidth = #".}
proc `maxWidth=`*(options: ScaleLineOptions, value: float) {.importjs: "#.maxWidth = #".}
proc `render=`*(options: ScaleLineOptions, value: JsObject) {.importjs: "#.render = #".}
proc `render=`*(options: ScaleLineOptions, value: RootRef) {.importjs: "#.render = #".}
proc `target=`*(options: ScaleLineOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: ScaleLineOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: ScaleLineOptions, value: RootRef) {.importjs: "#.target = #".}
proc `units=`*(options: ScaleLineOptions, value: JsObject) {.importjs: "#.units = #".}
proc `units=`*(options: ScaleLineOptions, value: RootRef) {.importjs: "#.units = #".}
proc `bar=`*(options: ScaleLineOptions, value: bool) {.importjs: "#.bar = #".}
proc `steps=`*(options: ScaleLineOptions, value: float) {.importjs: "#.steps = #".}
proc `text=`*(options: ScaleLineOptions, value: bool) {.importjs: "#.text = #".}
proc `dpi=`*(options: ScaleLineOptions, value: float) {.importjs: "#.dpi = #".}

proc newScaleLine*(options: ScaleLineOptions): ScaleLine {.importjs: "(new olNs_control_ScaleLine.default(#))".}
