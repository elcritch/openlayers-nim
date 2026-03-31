import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_WebGLTile from 'ol/layer/WebGLTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_WebGLTile)".}

type
  WebGLTileLayerOptions* = ref object of JsRoot
  WebGLTileLayer* = ref object of JsRoot

proc newWebGLTileLayerOptions*(): WebGLTileLayerOptions {.importjs: "({})".}
proc `style=`*(
  options: WebGLTileLayerOptions, value: JsObject
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

proc `map=`*(options: WebGLTileLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `useInterimTilesOnError=`*(
  options: WebGLTileLayerOptions, value: bool
) {.importjs: "#.useInterimTilesOnError = #".}

proc `cacheSize=`*(
  options: WebGLTileLayerOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `properties=`*(
  options: WebGLTileLayerOptions, value: JsObject
) {.importjs: "#.properties = #".}

proc newWebGLTileLayer*(
  options: JsObject = jsUndefined
): WebGLTileLayer {.importjs: "(new olNs_layer_WebGLTile.default(#))".}

proc newWebGLTileLayer*(
  options: WebGLTileLayerOptions
): WebGLTileLayer {.importjs: "(new olNs_layer_WebGLTile.default(#))".}

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
