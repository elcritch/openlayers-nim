import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_FullScreen from 'ol/control/FullScreen.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_FullScreen)".}

type
  FullScreen* = ref object of JsRoot
proc newFullScreen*(options: JsObject = jsUndefined): FullScreen {.importjs: "(new olNs_control_FullScreen.default(#))".}

type
  FullScreenOptions* = ref object of JsRoot

proc newFullScreenOptions*(): FullScreenOptions {.importjs: "({})".}
proc `className=`*(options: FullScreenOptions, value: cstring) {.importjs: "#.className = #".}
proc `label=`*(options: FullScreenOptions, value: cstring) {.importjs: "#.label = #".}
proc `label=`*(options: FullScreenOptions, value: JsObject) {.importjs: "#.label = #".}
proc `label=`*(options: FullScreenOptions, value: RootRef) {.importjs: "#.label = #".}
proc `labelActive=`*(options: FullScreenOptions, value: cstring) {.importjs: "#.labelActive = #".}
proc `labelActive=`*(options: FullScreenOptions, value: JsObject) {.importjs: "#.labelActive = #".}
proc `labelActive=`*(options: FullScreenOptions, value: RootRef) {.importjs: "#.labelActive = #".}
proc `activeClassName=`*(options: FullScreenOptions, value: cstring) {.importjs: "#.activeClassName = #".}
proc `inactiveClassName=`*(options: FullScreenOptions, value: cstring) {.importjs: "#.inactiveClassName = #".}
proc `tipLabel=`*(options: FullScreenOptions, value: cstring) {.importjs: "#.tipLabel = #".}
proc `keys=`*(options: FullScreenOptions, value: bool) {.importjs: "#.keys = #".}
proc `target=`*(options: FullScreenOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: FullScreenOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: FullScreenOptions, value: RootRef) {.importjs: "#.target = #".}
proc `source=`*(options: FullScreenOptions, value: cstring) {.importjs: "#.source = #".}
proc `source=`*(options: FullScreenOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: FullScreenOptions, value: RootRef) {.importjs: "#.source = #".}

proc newFullScreen*(options: FullScreenOptions): FullScreen {.importjs: "(new olNs_control_FullScreen.default(#))".}
