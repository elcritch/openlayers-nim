import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Layer from 'ol/layer/Layer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Layer)".}

type
  Layer* = ref object of JsRoot
proc newLayer*(): Layer {.importjs: "(new olNs_layer_Layer.default())".}

proc inView*(layerState: JsObject, viewState: JsObject): bool {.importjs: "olNs_layer_Layer.inView(#, #)".}

type
  LayerOptions* = ref object of JsRoot

proc newLayerOptions*(): LayerOptions {.importjs: "({})".}
proc `className=`*(options: LayerOptions, value: cstring) {.importjs: "#.className = #".}
proc `opacity=`*(options: LayerOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: LayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: LayerOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: LayerOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: LayerOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: LayerOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: LayerOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: LayerOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: LayerOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `source=`*(options: LayerOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: LayerOptions, value: RootRef) {.importjs: "#.source = #".}
proc `map=`*(options: LayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: LayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `render=`*(options: LayerOptions, value: JsObject) {.importjs: "#.render = #".}
proc `render=`*(options: LayerOptions, value: RootRef) {.importjs: "#.render = #".}
proc `properties=`*(options: LayerOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: LayerOptions, value: RootRef) {.importjs: "#.properties = #".}

proc newLayer*(options: LayerOptions): Layer {.importjs: "(new olNs_layer_Layer.default(#))".}
