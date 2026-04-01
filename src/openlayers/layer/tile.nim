import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_layer_Tile from 'ol/layer/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Tile)".}

type
  TileLayer* = ref object of JsRoot
proc newTileLayer*(options: JsObject = jsUndefined): TileLayer {.importjs: "(new olNs_layer_Tile.default(#))".}

type
  TileLayerOptions* = ref object of JsRoot

proc newTileLayerOptions*(): TileLayerOptions {.importjs: "({})".}
proc `className=`*(options: TileLayerOptions, value: cstring) {.importjs: "#.className = #".}
proc `opacity=`*(options: TileLayerOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: TileLayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: TileLayerOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: TileLayerOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: TileLayerOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: TileLayerOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: TileLayerOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: TileLayerOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: TileLayerOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `preload=`*(options: TileLayerOptions, value: float) {.importjs: "#.preload = #".}
proc `source=`*(options: TileLayerOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: TileLayerOptions, value: RootRef) {.importjs: "#.source = #".}
proc `map=`*(options: TileLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: TileLayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `background=`*(options: TileLayerOptions, value: JsObject) {.importjs: "#.background = #".}
proc `background=`*(options: TileLayerOptions, value: RootRef) {.importjs: "#.background = #".}
proc `background=`*(options: TileLayerOptions, value: cstring) {.importjs: "#.background = #".}
proc `background=`*(options: TileLayerOptions, value: bool) {.importjs: "#.background = #".}
proc `useInterimTilesOnError=`*(options: TileLayerOptions, value: bool) {.importjs: "#.useInterimTilesOnError = #".}
proc `properties=`*(options: TileLayerOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: TileLayerOptions, value: RootRef) {.importjs: "#.properties = #".}
proc `cacheSize=`*(options: TileLayerOptions, value: float) {.importjs: "#.cacheSize = #".}

proc newTileLayer*(options: TileLayerOptions): TileLayer {.importjs: "(new olNs_layer_Tile.default(#))".}
