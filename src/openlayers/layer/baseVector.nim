import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_BaseVector from 'ol/layer/BaseVector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_BaseVector)".}

type
  BaseVectorLayer* = ref object of JsRoot
proc newBaseVectorLayer*(): BaseVectorLayer {.importjs: "(new olNs_layer_BaseVector.default())".}

type
  BaseVectorLayerOptions* = ref object of JsRoot

proc newBaseVectorLayerOptions*(): BaseVectorLayerOptions {.importjs: "({})".}
proc `className=`*(options: BaseVectorLayerOptions, value: cstring) {.importjs: "#.className = #".}
proc `opacity=`*(options: BaseVectorLayerOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: BaseVectorLayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: BaseVectorLayerOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: BaseVectorLayerOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: BaseVectorLayerOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: BaseVectorLayerOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: BaseVectorLayerOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: BaseVectorLayerOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: BaseVectorLayerOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `renderOrder=`*(options: BaseVectorLayerOptions, value: JsObject) {.importjs: "#.renderOrder = #".}
proc `renderOrder=`*(options: BaseVectorLayerOptions, value: RootRef) {.importjs: "#.renderOrder = #".}
proc `renderBuffer=`*(options: BaseVectorLayerOptions, value: float) {.importjs: "#.renderBuffer = #".}
proc `source=`*(options: BaseVectorLayerOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: BaseVectorLayerOptions, value: RootRef) {.importjs: "#.source = #".}
proc `map=`*(options: BaseVectorLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: BaseVectorLayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `declutter=`*(options: BaseVectorLayerOptions, value: cstring) {.importjs: "#.declutter = #".}
proc `declutter=`*(options: BaseVectorLayerOptions, value: float) {.importjs: "#.declutter = #".}
proc `declutter=`*(options: BaseVectorLayerOptions, value: bool) {.importjs: "#.declutter = #".}
proc `style=`*(options: BaseVectorLayerOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: BaseVectorLayerOptions, value: RootRef) {.importjs: "#.style = #".}
proc `background=`*(options: BaseVectorLayerOptions, value: JsObject) {.importjs: "#.background = #".}
proc `background=`*(options: BaseVectorLayerOptions, value: RootRef) {.importjs: "#.background = #".}
proc `background=`*(options: BaseVectorLayerOptions, value: cstring) {.importjs: "#.background = #".}
proc `background=`*(options: BaseVectorLayerOptions, value: bool) {.importjs: "#.background = #".}
proc `updateWhileAnimating=`*(options: BaseVectorLayerOptions, value: bool) {.importjs: "#.updateWhileAnimating = #".}
proc `updateWhileInteracting=`*(options: BaseVectorLayerOptions, value: bool) {.importjs: "#.updateWhileInteracting = #".}
proc `properties=`*(options: BaseVectorLayerOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: BaseVectorLayerOptions, value: RootRef) {.importjs: "#.properties = #".}

proc newBaseVectorLayer*(options: BaseVectorLayerOptions): BaseVectorLayer {.importjs: "(new olNs_layer_BaseVector.default(#))".}
