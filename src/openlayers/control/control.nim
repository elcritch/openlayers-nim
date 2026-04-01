import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_control_Control from 'ol/control/Control.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Control)".}

type
  Control* = ref object of JsRoot
proc newControl*(): Control {.importjs: "(new olNs_control_Control.default())".}

type
  ControlOptions* = ref object of JsRoot

proc newControlOptions*(): ControlOptions {.importjs: "({})".}
proc `element=`*(options: ControlOptions, value: JsObject) {.importjs: "#.element = #".}
proc `element=`*(options: ControlOptions, value: RootRef) {.importjs: "#.element = #".}
proc `render=`*(options: ControlOptions, value: JsObject) {.importjs: "#.render = #".}
proc `render=`*(options: ControlOptions, value: RootRef) {.importjs: "#.render = #".}
proc `target=`*(options: ControlOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: ControlOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: ControlOptions, value: RootRef) {.importjs: "#.target = #".}

proc newControl*(options: ControlOptions): Control {.importjs: "(new olNs_control_Control.default(#))".}
