import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_Tile from 'ol/source/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Tile)".}

type
  TileSource* = ref object of JsRoot
proc newTileSource*(options: JsObject): TileSource {.importjs: "(new olNs_source_Tile.default(#))".}
proc getGutterForProjection*(self: TileSource, projection: JsObject): float {.importjs: "#.getGutterForProjection(#)".}
proc getKey*(self: TileSource): cstring {.importjs: "#.getKey()".}
proc setKey*(self: TileSource, key: cstring) {.importjs: "#.setKey(#)".}
proc getTile*(self: TileSource, z: float, x: float, y: float, pixelRatio: float, projection: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getTile(#, #, #, #, #, #)".}
proc getTileGrid*(self: TileSource): JsObject {.importjs: "#.getTileGrid()".}
proc getTileGridForProjection*(self: TileSource, projection: JsObject): JsObject {.importjs: "#.getTileGridForProjection(#)".}
proc getTilePixelRatio*(self: TileSource, pixelRatio: float): float {.importjs: "#.getTilePixelRatio(#)".}
proc getTilePixelSize*(self: TileSource, z: float, pixelRatio: float, projection: JsObject): JsObject {.importjs: "#.getTilePixelSize(#, #, #)".}
proc getTileCoordForTileUrlFunction*(self: TileSource, tileCoord: JsObject, projection: JsObject = jsUndefined): JsObject {.importjs: "#.getTileCoordForTileUrlFunction(#, #)".}
proc clear*(self: TileSource) {.importjs: "#.clear()".}

type
  TileSourceOptions* = ref object of JsRoot

proc newTileSourceOptions*(): TileSourceOptions {.importjs: "({})".}
proc `attributions=`*(options: TileSourceOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileSourceOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileSourceOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileSourceOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `attributionsCollapsible=`*(options: TileSourceOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `cacheSize=`*(options: TileSourceOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `tilePixelRatio=`*(options: TileSourceOptions, value: float) {.importjs: "#.tilePixelRatio = #".}
proc `projection=`*(options: TileSourceOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: TileSourceOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `state=`*(options: TileSourceOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: TileSourceOptions, value: RootRef) {.importjs: "#.state = #".}
proc `tileGrid=`*(options: TileSourceOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: TileSourceOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `wrapX=`*(options: TileSourceOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: TileSourceOptions, value: float) {.importjs: "#.transition = #".}
proc `key=`*(options: TileSourceOptions, value: cstring) {.importjs: "#.key = #".}
proc `zDirection=`*(options: TileSourceOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: TileSourceOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: TileSourceOptions, value: RootRef) {.importjs: "#.zDirection = #".}
proc `interpolate=`*(options: TileSourceOptions, value: bool) {.importjs: "#.interpolate = #".}

proc newTileSource*(options: TileSourceOptions): TileSource {.importjs: "(new olNs_source_Tile.default(#))".}
