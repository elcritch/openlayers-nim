import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Tile from 'ol/layer/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Tile)".}

type
  OlTileLayerOptions* = ref object of JsRoot
  OlTileLayer* = ref object of JsRoot

proc newOlTileLayerOptions*(): OlTileLayerOptions {.importjs: "({})".}
proc `className=`*(
  options: OlTileLayerOptions, value: cstring
) {.importjs: "#.className = #".}

proc `opacity=`*(
  options: OlTileLayerOptions, value: float
) {.importjs: "#.opacity = #".}

proc `visible=`*(options: OlTileLayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(
  options: OlTileLayerOptions, value: JsObject
) {.importjs: "#.extent = #".}

proc `zIndex=`*(options: OlTileLayerOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(
  options: OlTileLayerOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxResolution=`*(
  options: OlTileLayerOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `minZoom=`*(
  options: OlTileLayerOptions, value: float
) {.importjs: "#.minZoom = #".}

proc `maxZoom=`*(
  options: OlTileLayerOptions, value: float
) {.importjs: "#.maxZoom = #".}

proc `preload=`*(
  options: OlTileLayerOptions, value: float
) {.importjs: "#.preload = #".}

proc `source=`*(
  options: OlTileLayerOptions, value: JsObject
) {.importjs: "#.source = #".}

proc `source=`*(
  options: OlTileLayerOptions, value: RootRef
) {.importjs: "#.source = #".}

proc `map=`*(options: OlTileLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `background=`*(
  options: OlTileLayerOptions, value: JsObject
) {.importjs: "#.background = #".}

proc `useInterimTilesOnError=`*(
  options: OlTileLayerOptions, value: bool
) {.importjs: "#.useInterimTilesOnError = #".}

proc `properties=`*(
  options: OlTileLayerOptions, value: JsObject
) {.importjs: "#.properties = #".}

proc `cacheSize=`*(
  options: OlTileLayerOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc newOlTileLayer*(
  options: JsObject = jsUndefined
): OlTileLayer {.importjs: "(new olNs_layer_Tile.default(#))".}

proc newOlTileLayer*(
  options: OlTileLayerOptions
): OlTileLayer {.importjs: "(new olNs_layer_Tile.default(#))".}
