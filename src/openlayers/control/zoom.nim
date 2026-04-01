import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_control_Zoom from 'ol/control/Zoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Zoom)".}

type
  Zoom* = ref object of JsRoot
proc newZoom*(options: JsObject = jsUndefined): Zoom {.importjs: "(new olNs_control_Zoom.default(#))".}

type
  ZoomOptions* = ref object of JsRoot

proc newZoomOptions*(): ZoomOptions {.importjs: "({})".}
proc `duration=`*(options: ZoomOptions, value: float) {.importjs: "#.duration = #".}
proc `className=`*(options: ZoomOptions, value: cstring) {.importjs: "#.className = #".}
proc `zoomInClassName=`*(options: ZoomOptions, value: cstring) {.importjs: "#.zoomInClassName = #".}
proc `zoomOutClassName=`*(options: ZoomOptions, value: cstring) {.importjs: "#.zoomOutClassName = #".}
proc `zoomInLabel=`*(options: ZoomOptions, value: cstring) {.importjs: "#.zoomInLabel = #".}
proc `zoomInLabel=`*(options: ZoomOptions, value: JsObject) {.importjs: "#.zoomInLabel = #".}
proc `zoomInLabel=`*(options: ZoomOptions, value: RootRef) {.importjs: "#.zoomInLabel = #".}
proc `zoomOutLabel=`*(options: ZoomOptions, value: cstring) {.importjs: "#.zoomOutLabel = #".}
proc `zoomOutLabel=`*(options: ZoomOptions, value: JsObject) {.importjs: "#.zoomOutLabel = #".}
proc `zoomOutLabel=`*(options: ZoomOptions, value: RootRef) {.importjs: "#.zoomOutLabel = #".}
proc `zoomInTipLabel=`*(options: ZoomOptions, value: cstring) {.importjs: "#.zoomInTipLabel = #".}
proc `zoomOutTipLabel=`*(options: ZoomOptions, value: cstring) {.importjs: "#.zoomOutTipLabel = #".}
proc `delta=`*(options: ZoomOptions, value: float) {.importjs: "#.delta = #".}
proc `target=`*(options: ZoomOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: ZoomOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: ZoomOptions, value: RootRef) {.importjs: "#.target = #".}

proc newZoom*(options: ZoomOptions): Zoom {.importjs: "(new olNs_control_Zoom.default(#))".}
