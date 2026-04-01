import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_control_ZoomToExtent from 'ol/control/ZoomToExtent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_ZoomToExtent)".}

type
  ZoomToExtent* = ref object of JsRoot
proc newZoomToExtent*(options: JsObject = jsUndefined): ZoomToExtent {.importjs: "(new olNs_control_ZoomToExtent.default(#))".}
proc handleZoomToExtent*(self: ZoomToExtent) {.importjs: "#.handleZoomToExtent()".}

type
  ZoomToExtentOptions* = ref object of JsRoot

proc newZoomToExtentOptions*(): ZoomToExtentOptions {.importjs: "({})".}
proc `className=`*(options: ZoomToExtentOptions, value: cstring) {.importjs: "#.className = #".}
proc `target=`*(options: ZoomToExtentOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: ZoomToExtentOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: ZoomToExtentOptions, value: RootRef) {.importjs: "#.target = #".}
proc `label=`*(options: ZoomToExtentOptions, value: cstring) {.importjs: "#.label = #".}
proc `label=`*(options: ZoomToExtentOptions, value: JsObject) {.importjs: "#.label = #".}
proc `label=`*(options: ZoomToExtentOptions, value: RootRef) {.importjs: "#.label = #".}
proc `tipLabel=`*(options: ZoomToExtentOptions, value: cstring) {.importjs: "#.tipLabel = #".}
proc `extent=`*(options: ZoomToExtentOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: ZoomToExtentOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `fitOptions=`*(options: ZoomToExtentOptions, value: JsObject) {.importjs: "#.fitOptions = #".}
proc `fitOptions=`*(options: ZoomToExtentOptions, value: RootRef) {.importjs: "#.fitOptions = #".}

proc newZoomToExtent*(options: ZoomToExtentOptions): ZoomToExtent {.importjs: "(new olNs_control_ZoomToExtent.default(#))".}
