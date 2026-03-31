import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Vector from 'ol/layer/Vector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Vector)".}

type
  VectorLayer* = ref object of JsRoot
proc newVectorLayer*(options: JsObject = jsUndefined): VectorLayer {.importjs: "(new olNs_layer_Vector.default(#))".}

type
  VectorLayerOptions* = ref object of JsRoot

proc newVectorLayerOptions*(): VectorLayerOptions {.importjs: "({})".}
proc `className=`*(options: VectorLayerOptions, value: cstring) {.importjs: "#.className = #".}
proc `opacity=`*(options: VectorLayerOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: VectorLayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: VectorLayerOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: VectorLayerOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: VectorLayerOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: VectorLayerOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: VectorLayerOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: VectorLayerOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: VectorLayerOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `renderOrder=`*(options: VectorLayerOptions, value: JsObject) {.importjs: "#.renderOrder = #".}
proc `renderOrder=`*(options: VectorLayerOptions, value: RootRef) {.importjs: "#.renderOrder = #".}
proc `renderBuffer=`*(options: VectorLayerOptions, value: float) {.importjs: "#.renderBuffer = #".}
proc `source=`*(options: VectorLayerOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: VectorLayerOptions, value: RootRef) {.importjs: "#.source = #".}
proc `map=`*(options: VectorLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: VectorLayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `declutter=`*(options: VectorLayerOptions, value: cstring) {.importjs: "#.declutter = #".}
proc `declutter=`*(options: VectorLayerOptions, value: float) {.importjs: "#.declutter = #".}
proc `declutter=`*(options: VectorLayerOptions, value: bool) {.importjs: "#.declutter = #".}
proc `style=`*(options: VectorLayerOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: VectorLayerOptions, value: RootRef) {.importjs: "#.style = #".}
proc `background=`*(options: VectorLayerOptions, value: JsObject) {.importjs: "#.background = #".}
proc `background=`*(options: VectorLayerOptions, value: RootRef) {.importjs: "#.background = #".}
proc `background=`*(options: VectorLayerOptions, value: cstring) {.importjs: "#.background = #".}
proc `background=`*(options: VectorLayerOptions, value: bool) {.importjs: "#.background = #".}
proc `updateWhileAnimating=`*(options: VectorLayerOptions, value: bool) {.importjs: "#.updateWhileAnimating = #".}
proc `updateWhileInteracting=`*(options: VectorLayerOptions, value: bool) {.importjs: "#.updateWhileInteracting = #".}
proc `properties=`*(options: VectorLayerOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: VectorLayerOptions, value: RootRef) {.importjs: "#.properties = #".}

proc newVectorLayer*(options: VectorLayerOptions): VectorLayer {.importjs: "(new olNs_layer_Vector.default(#))".}
