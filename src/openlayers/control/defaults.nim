import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_defaults from 'ol/control/defaults.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_defaults)".}

type ControlDefaultsOptions* = ref object of JsRoot

proc newControlDefaultsOptions*(): ControlDefaultsOptions {.importjs: "({})".}
proc `attribution=`*(
  options: ControlDefaultsOptions, value: bool
) {.importjs: "#.attribution = #".}

proc `attributionOptions=`*(
  options: ControlDefaultsOptions, value: JsObject
) {.importjs: "#.attributionOptions = #".}

proc `attributionOptions=`*(
  options: ControlDefaultsOptions, value: RootRef
) {.importjs: "#.attributionOptions = #".}

proc `rotate=`*(
  options: ControlDefaultsOptions, value: bool
) {.importjs: "#.rotate = #".}

proc `rotateOptions=`*(
  options: ControlDefaultsOptions, value: JsObject
) {.importjs: "#.rotateOptions = #".}

proc `zoom=`*(options: ControlDefaultsOptions, value: bool) {.importjs: "#.zoom = #".}
proc `zoomOptions=`*(
  options: ControlDefaultsOptions, value: JsObject
) {.importjs: "#.zoomOptions = #".}

proc defaults*(
  options: JsObject = jsUndefined
): JsObject {.importjs: "olNs_control_defaults.defaults(#)".}

proc defaults*(
  options: ControlDefaultsOptions
): JsObject {.importjs: "olNs_control_defaults.defaults(#)".}
