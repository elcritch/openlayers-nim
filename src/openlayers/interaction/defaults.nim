import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_defaults from 'ol/interaction/defaults.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_defaults)".}

proc defaults*(options: JsObject = jsUndefined): JsObject {.importjs: "olNs_interaction_defaults.defaults(#)".}

type
  DefaultsOptions* = ref object of JsRoot

proc newDefaultsOptions*(): DefaultsOptions {.importjs: "({})".}
proc `altShiftDragRotate=`*(options: DefaultsOptions, value: bool) {.importjs: "#.altShiftDragRotate = #".}
proc `onFocusOnly=`*(options: DefaultsOptions, value: bool) {.importjs: "#.onFocusOnly = #".}
proc `doubleClickZoom=`*(options: DefaultsOptions, value: bool) {.importjs: "#.doubleClickZoom = #".}
proc `keyboard=`*(options: DefaultsOptions, value: bool) {.importjs: "#.keyboard = #".}
proc `mouseWheelZoom=`*(options: DefaultsOptions, value: bool) {.importjs: "#.mouseWheelZoom = #".}
proc `shiftDragZoom=`*(options: DefaultsOptions, value: bool) {.importjs: "#.shiftDragZoom = #".}
proc `dragPan=`*(options: DefaultsOptions, value: bool) {.importjs: "#.dragPan = #".}
proc `pinchRotate=`*(options: DefaultsOptions, value: bool) {.importjs: "#.pinchRotate = #".}
proc `pinchZoom=`*(options: DefaultsOptions, value: bool) {.importjs: "#.pinchZoom = #".}
proc `zoomDelta=`*(options: DefaultsOptions, value: float) {.importjs: "#.zoomDelta = #".}
proc `zoomDuration=`*(options: DefaultsOptions, value: float) {.importjs: "#.zoomDuration = #".}

proc defaults*(options: DefaultsOptions): JsObject {.importjs: "olNs_interaction_defaults.defaults(#)".}
