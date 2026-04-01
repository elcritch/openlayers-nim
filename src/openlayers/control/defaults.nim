import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_defaults from 'ol/control/defaults.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_defaults)".}

proc defaults*(options: JsObject = jsUndefined): JsObject {.importjs: "olNs_control_defaults.defaults(#)".}

type
  DefaultsOptions* = ref object of JsRoot

proc newDefaultsOptions*(): DefaultsOptions {.importjs: "({})".}
proc `attribution=`*(options: DefaultsOptions, value: bool) {.importjs: "#.attribution = #".}
proc `attributionOptions=`*(options: DefaultsOptions, value: JsObject) {.importjs: "#.attributionOptions = #".}
proc `attributionOptions=`*(options: DefaultsOptions, value: RootRef) {.importjs: "#.attributionOptions = #".}
proc `rotate=`*(options: DefaultsOptions, value: bool) {.importjs: "#.rotate = #".}
proc `rotateOptions=`*(options: DefaultsOptions, value: JsObject) {.importjs: "#.rotateOptions = #".}
proc `rotateOptions=`*(options: DefaultsOptions, value: RootRef) {.importjs: "#.rotateOptions = #".}
proc `zoom=`*(options: DefaultsOptions, value: bool) {.importjs: "#.zoom = #".}
proc `zoomOptions=`*(options: DefaultsOptions, value: JsObject) {.importjs: "#.zoomOptions = #".}
proc `zoomOptions=`*(options: DefaultsOptions, value: RootRef) {.importjs: "#.zoomOptions = #".}

proc defaults*(options: DefaultsOptions): JsObject {.importjs: "olNs_control_defaults.defaults(#)".}
