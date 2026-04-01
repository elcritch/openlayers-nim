import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_layer_VectorImage from 'ol/layer/VectorImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_VectorImage)".}

type
  VectorImageLayer* = ref object of JsRoot
proc newVectorImageLayer*(options: JsObject = jsUndefined): VectorImageLayer {.importjs: "(new olNs_layer_VectorImage.default(#))".}
proc getImageRatio*(self: VectorImageLayer): float {.importjs: "#.getImageRatio()".}

type
  VectorImageLayerOptions* = ref object of JsRoot

proc newVectorImageLayerOptions*(): VectorImageLayerOptions {.importjs: "({})".}
proc `className=`*(options: VectorImageLayerOptions, value: cstring) {.importjs: "#.className = #".}
proc `opacity=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: VectorImageLayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: VectorImageLayerOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: VectorImageLayerOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `renderOrder=`*(options: VectorImageLayerOptions, value: JsObject) {.importjs: "#.renderOrder = #".}
proc `renderOrder=`*(options: VectorImageLayerOptions, value: RootRef) {.importjs: "#.renderOrder = #".}
proc `renderBuffer=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.renderBuffer = #".}
proc `source=`*(options: VectorImageLayerOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: VectorImageLayerOptions, value: RootRef) {.importjs: "#.source = #".}
proc `map=`*(options: VectorImageLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: VectorImageLayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `declutter=`*(options: VectorImageLayerOptions, value: cstring) {.importjs: "#.declutter = #".}
proc `declutter=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.declutter = #".}
proc `declutter=`*(options: VectorImageLayerOptions, value: bool) {.importjs: "#.declutter = #".}
proc `style=`*(options: VectorImageLayerOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: VectorImageLayerOptions, value: RootRef) {.importjs: "#.style = #".}
proc `background=`*(options: VectorImageLayerOptions, value: JsObject) {.importjs: "#.background = #".}
proc `background=`*(options: VectorImageLayerOptions, value: RootRef) {.importjs: "#.background = #".}
proc `background=`*(options: VectorImageLayerOptions, value: cstring) {.importjs: "#.background = #".}
proc `background=`*(options: VectorImageLayerOptions, value: bool) {.importjs: "#.background = #".}
proc `imageRatio=`*(options: VectorImageLayerOptions, value: float) {.importjs: "#.imageRatio = #".}
proc `properties=`*(options: VectorImageLayerOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: VectorImageLayerOptions, value: RootRef) {.importjs: "#.properties = #".}

proc newVectorImageLayer*(options: VectorImageLayerOptions): VectorImageLayer {.importjs: "(new olNs_layer_VectorImage.default(#))".}
