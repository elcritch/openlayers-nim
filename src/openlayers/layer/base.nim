import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_layer_Base from 'ol/layer/Base.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Base)".}

type
  BaseLayer* = ref object of JsRoot
proc newBaseLayer*(): BaseLayer {.importjs: "(new olNs_layer_Base.default())".}
proc getOpacity*(self: BaseLayer): float {.importjs: "#.getOpacity()".}
proc setOpacity*(self: BaseLayer, opacity: float) {.importjs: "#.setOpacity(#)".}
proc getVisible*(self: BaseLayer): bool {.importjs: "#.getVisible()".}
proc setVisible*(self: BaseLayer, visible: bool) {.importjs: "#.setVisible(#)".}

type
  BaseLayerOptions* = ref object of JsRoot

proc newBaseLayerOptions*(): BaseLayerOptions {.importjs: "({})".}
proc `className=`*(options: BaseLayerOptions, value: cstring) {.importjs: "#.className = #".}
proc `opacity=`*(options: BaseLayerOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: BaseLayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: BaseLayerOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: BaseLayerOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: BaseLayerOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: BaseLayerOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: BaseLayerOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: BaseLayerOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: BaseLayerOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `background=`*(options: BaseLayerOptions, value: JsObject) {.importjs: "#.background = #".}
proc `background=`*(options: BaseLayerOptions, value: RootRef) {.importjs: "#.background = #".}
proc `background=`*(options: BaseLayerOptions, value: cstring) {.importjs: "#.background = #".}
proc `background=`*(options: BaseLayerOptions, value: bool) {.importjs: "#.background = #".}
proc `properties=`*(options: BaseLayerOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: BaseLayerOptions, value: RootRef) {.importjs: "#.properties = #".}

proc newBaseLayer*(options: BaseLayerOptions): BaseLayer {.importjs: "(new olNs_layer_Base.default(#))".}
