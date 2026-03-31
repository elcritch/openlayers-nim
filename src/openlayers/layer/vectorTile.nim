import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_VectorTile from 'ol/layer/VectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_VectorTile)".}

type
  VectorTileLayer* = ref object of JsRoot
proc newVectorTileLayer*(options: JsObject = jsUndefined): VectorTileLayer {.importjs: "(new olNs_layer_VectorTile.default(#))".}
proc getFeaturesInExtent*(self: VectorTileLayer, extent: JsObject): JsObject {.importjs: "#.getFeaturesInExtent(#)".}
proc getRenderMode*(self: VectorTileLayer): JsObject {.importjs: "#.getRenderMode()".}
proc getPreload*(self: VectorTileLayer): float {.importjs: "#.getPreload()".}
proc getUseInterimTilesOnError*(self: VectorTileLayer): bool {.importjs: "#.getUseInterimTilesOnError()".}
proc setPreload*(self: VectorTileLayer, preload: float) {.importjs: "#.setPreload(#)".}
proc setUseInterimTilesOnError*(self: VectorTileLayer, useInterimTilesOnError: bool) {.importjs: "#.setUseInterimTilesOnError(#)".}

type
  VectorTileLayerOptions* = ref object of JsRoot

proc newVectorTileLayerOptions*(): VectorTileLayerOptions {.importjs: "({})".}
proc `className=`*(options: VectorTileLayerOptions, value: cstring) {.importjs: "#.className = #".}
proc `opacity=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: VectorTileLayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: VectorTileLayerOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: VectorTileLayerOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `renderOrder=`*(options: VectorTileLayerOptions, value: JsObject) {.importjs: "#.renderOrder = #".}
proc `renderOrder=`*(options: VectorTileLayerOptions, value: RootRef) {.importjs: "#.renderOrder = #".}
proc `renderBuffer=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.renderBuffer = #".}
proc `renderMode=`*(options: VectorTileLayerOptions, value: JsObject) {.importjs: "#.renderMode = #".}
proc `renderMode=`*(options: VectorTileLayerOptions, value: RootRef) {.importjs: "#.renderMode = #".}
proc `source=`*(options: VectorTileLayerOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: VectorTileLayerOptions, value: RootRef) {.importjs: "#.source = #".}
proc `map=`*(options: VectorTileLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: VectorTileLayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `declutter=`*(options: VectorTileLayerOptions, value: cstring) {.importjs: "#.declutter = #".}
proc `declutter=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.declutter = #".}
proc `declutter=`*(options: VectorTileLayerOptions, value: bool) {.importjs: "#.declutter = #".}
proc `style=`*(options: VectorTileLayerOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: VectorTileLayerOptions, value: RootRef) {.importjs: "#.style = #".}
proc `background=`*(options: VectorTileLayerOptions, value: JsObject) {.importjs: "#.background = #".}
proc `background=`*(options: VectorTileLayerOptions, value: RootRef) {.importjs: "#.background = #".}
proc `background=`*(options: VectorTileLayerOptions, value: cstring) {.importjs: "#.background = #".}
proc `background=`*(options: VectorTileLayerOptions, value: bool) {.importjs: "#.background = #".}
proc `updateWhileAnimating=`*(options: VectorTileLayerOptions, value: bool) {.importjs: "#.updateWhileAnimating = #".}
proc `updateWhileInteracting=`*(options: VectorTileLayerOptions, value: bool) {.importjs: "#.updateWhileInteracting = #".}
proc `preload=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.preload = #".}
proc `useInterimTilesOnError=`*(options: VectorTileLayerOptions, value: bool) {.importjs: "#.useInterimTilesOnError = #".}
proc `properties=`*(options: VectorTileLayerOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: VectorTileLayerOptions, value: RootRef) {.importjs: "#.properties = #".}
proc `cacheSize=`*(options: VectorTileLayerOptions, value: float) {.importjs: "#.cacheSize = #".}

proc newVectorTileLayer*(options: VectorTileLayerOptions): VectorTileLayer {.importjs: "(new olNs_layer_VectorTile.default(#))".}
