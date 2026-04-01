import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Group from 'ol/layer/Group.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Group)".}

type
  LayerGroup* = ref object of JsRoot
proc newLayerGroup*(): LayerGroup {.importjs: "(new olNs_layer_Group.default())".}
proc getOpacity*(self: LayerGroup): float {.importjs: "#.getOpacity()".}
proc setOpacity*(self: LayerGroup, opacity: float) {.importjs: "#.setOpacity(#)".}
proc getVisible*(self: LayerGroup): bool {.importjs: "#.getVisible()".}
proc setVisible*(self: LayerGroup, visible: bool) {.importjs: "#.setVisible(#)".}
proc getLayers*(self: LayerGroup): JsObject {.importjs: "#.getLayers()".}

type
  LayerGroupOptions* = ref object of JsRoot

proc newLayerGroupOptions*(): LayerGroupOptions {.importjs: "({})".}
proc `opacity=`*(options: LayerGroupOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: LayerGroupOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: LayerGroupOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: LayerGroupOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: LayerGroupOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: LayerGroupOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: LayerGroupOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: LayerGroupOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: LayerGroupOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `layers=`*(options: LayerGroupOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `layers=`*(options: LayerGroupOptions, value: RootRef) {.importjs: "#.layers = #".}
proc `layers=`*[T](options: LayerGroupOptions, value: seq[T]) {.importjs: "#.layers = #".}
proc `properties=`*(options: LayerGroupOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: LayerGroupOptions, value: RootRef) {.importjs: "#.properties = #".}

proc newLayerGroup*(options: LayerGroupOptions): LayerGroup {.importjs: "(new olNs_layer_Group.default(#))".}
