import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_layer_WebGLTile from 'ol/layer/WebGLTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_WebGLTile)".}

type WebGLTileLayer* = ref object of JsRoot
proc newWebGLTileLayer*(
  options: JsObject = jsUndefined
): WebGLTileLayer {.importjs: "(new olNs_layer_WebGLTile.default(#))".}

proc getOpacity*(self: WebGLTileLayer): float {.importjs: "#.getOpacity()".}
proc setOpacity*(self: WebGLTileLayer, opacity: float) {.importjs: "#.setOpacity(#)".}
proc getSources*(
  self: WebGLTileLayer, extent: JsObject, resolution: float
): JsObject {.importjs: "#.getSources(#, #)".}

proc renderSources*(
  self: WebGLTileLayer, frameState: JsObject, sources: JsObject
): JsObject {.importjs: "#.renderSources(#, #)".}

proc setStyle*(self: WebGLTileLayer, style: JsObject) {.importjs: "#.setStyle(#)".}
proc updateStyleVariables*(
  self: WebGLTileLayer, variables: JsObject
) {.importjs: "#.updateStyleVariables(#)".}

type WebGLTileLayerOptions* = ref object of JsRoot

proc newWebGLTileLayerOptions*(): WebGLTileLayerOptions {.importjs: "({})".}
proc `style=`*(
  options: WebGLTileLayerOptions, value: JsObject
) {.importjs: "#.style = #".}

proc `style=`*(
  options: WebGLTileLayerOptions, value: RootRef
) {.importjs: "#.style = #".}

proc `className=`*(
  options: WebGLTileLayerOptions, value: cstring
) {.importjs: "#.className = #".}

proc `opacity=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.opacity = #".}

proc `visible=`*(
  options: WebGLTileLayerOptions, value: bool
) {.importjs: "#.visible = #".}

proc `extent=`*(
  options: WebGLTileLayerOptions, value: JsObject
) {.importjs: "#.extent = #".}

proc `extent=`*(
  options: WebGLTileLayerOptions, value: RootRef
) {.importjs: "#.extent = #".}

proc `zIndex=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.zIndex = #".}

proc `minResolution=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxResolution=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `minZoom=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.minZoom = #".}

proc `maxZoom=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.maxZoom = #".}

proc `preload=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.preload = #".}

proc `source=`*(
  options: WebGLTileLayerOptions, value: JsObject
) {.importjs: "#.source = #".}

proc `source=`*(
  options: WebGLTileLayerOptions, value: RootRef
) {.importjs: "#.source = #".}

proc `sources=`*(
  options: WebGLTileLayerOptions, value: JsObject
) {.importjs: "#.sources = #".}

proc `sources=`*(
  options: WebGLTileLayerOptions, value: RootRef
) {.importjs: "#.sources = #".}

proc `sources=`*[T](
  options: WebGLTileLayerOptions, value: seq[T]
) {.importjs: "#.sources = #".}

proc `map=`*(options: WebGLTileLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: WebGLTileLayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `useInterimTilesOnError=`*(
  options: WebGLTileLayerOptions, value: bool
) {.importjs: "#.useInterimTilesOnError = #".}

proc `cacheSize=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `properties=`*(
  options: WebGLTileLayerOptions, value: JsObject
) {.importjs: "#.properties = #".}

proc `properties=`*(
  options: WebGLTileLayerOptions, value: RootRef
) {.importjs: "#.properties = #".}

proc newWebGLTileLayer*(
  options: WebGLTileLayerOptions
): WebGLTileLayer {.importjs: "(new olNs_layer_WebGLTile.default(#))".}
