import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_Rotate from 'ol/control/Rotate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Rotate)".}

type Rotate* = ref object of JsRoot
proc newRotate*(
  options: JsObject = jsUndefined
): Rotate {.importjs: "(new olNs_control_Rotate.default(#))".}

type RotateOptions* = ref object of JsRoot

proc newRotateOptions*(): RotateOptions {.importjs: "({})".}
proc `className=`*(
  options: RotateOptions, value: cstring
) {.importjs: "#.className = #".}

proc `label=`*(options: RotateOptions, value: cstring) {.importjs: "#.label = #".}
proc `label=`*(options: RotateOptions, value: JsObject) {.importjs: "#.label = #".}
proc `label=`*(options: RotateOptions, value: RootRef) {.importjs: "#.label = #".}
proc `tipLabel=`*(options: RotateOptions, value: cstring) {.importjs: "#.tipLabel = #".}
proc `compassClassName=`*(
  options: RotateOptions, value: cstring
) {.importjs: "#.compassClassName = #".}

proc `duration=`*(options: RotateOptions, value: float) {.importjs: "#.duration = #".}
proc `autoHide=`*(options: RotateOptions, value: bool) {.importjs: "#.autoHide = #".}
proc `render=`*(options: RotateOptions, value: JsObject) {.importjs: "#.render = #".}
proc `render=`*(options: RotateOptions, value: RootRef) {.importjs: "#.render = #".}
proc `resetNorth=`*(
  options: RotateOptions, value: JsObject
) {.importjs: "#.resetNorth = #".}

proc `resetNorth=`*(
  options: RotateOptions, value: RootRef
) {.importjs: "#.resetNorth = #".}

proc `target=`*(options: RotateOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: RotateOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: RotateOptions, value: RootRef) {.importjs: "#.target = #".}

proc newRotate*(
  options: RotateOptions
): Rotate {.importjs: "(new olNs_control_Rotate.default(#))".}
