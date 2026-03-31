import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Extent from 'ol/interaction/Extent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Extent)".}

type
  Extent* = ref object of JsRoot
proc newExtent*(options: JsObject = jsUndefined): Extent {.importjs: "(new olNs_interaction_Extent.default(#))".}
proc getExtent*(self: Extent): JsObject {.importjs: "#.getExtent()".}
proc getExtentInternal*(self: Extent): JsObject {.importjs: "#.getExtentInternal()".}
proc setExtent*(self: Extent, extent: JsObject) {.importjs: "#.setExtent(#)".}

type
  ExtentOptions* = ref object of JsRoot

proc newExtentOptions*(): ExtentOptions {.importjs: "({})".}
proc `condition=`*(options: ExtentOptions, value: JsObject) {.importjs: "#.condition = #".}
proc `condition=`*(options: ExtentOptions, value: RootRef) {.importjs: "#.condition = #".}
proc `createCondition=`*(options: ExtentOptions, value: JsObject) {.importjs: "#.createCondition = #".}
proc `createCondition=`*(options: ExtentOptions, value: RootRef) {.importjs: "#.createCondition = #".}
proc `drag=`*(options: ExtentOptions, value: bool) {.importjs: "#.drag = #".}
proc `extent=`*(options: ExtentOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: ExtentOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `boxStyle=`*(options: ExtentOptions, value: JsObject) {.importjs: "#.boxStyle = #".}
proc `boxStyle=`*(options: ExtentOptions, value: RootRef) {.importjs: "#.boxStyle = #".}
proc `pixelTolerance=`*(options: ExtentOptions, value: float) {.importjs: "#.pixelTolerance = #".}
proc `pointerStyle=`*(options: ExtentOptions, value: JsObject) {.importjs: "#.pointerStyle = #".}
proc `pointerStyle=`*(options: ExtentOptions, value: RootRef) {.importjs: "#.pointerStyle = #".}
proc `wrapX=`*(options: ExtentOptions, value: bool) {.importjs: "#.wrapX = #".}

proc newExtent*(options: ExtentOptions): Extent {.importjs: "(new olNs_interaction_Extent.default(#))".}
