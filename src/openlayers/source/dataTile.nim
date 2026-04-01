import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_DataTile from 'ol/source/DataTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_DataTile)".}

type
  DataTileSource* = ref object of JsRoot
proc newDataTileSource*(options: JsObject): DataTileSource {.importjs: "(new olNs_source_DataTile.default(#))".}
proc handleTileChange*(self: DataTileSource, event: JsObject) {.importjs: "#.handleTileChange_(#)".}
proc setTileSizes*(self: DataTileSource, tileSizes: JsObject) {.importjs: "#.setTileSizes(#)".}
proc getTileSize*(self: DataTileSource, z: float): JsObject {.importjs: "#.getTileSize(#)".}
proc setLoader*(self: DataTileSource, loader: JsObject) {.importjs: "#.setLoader(#)".}
proc getReprojTile*(self: DataTileSource, z: float, x: float, y: float, targetProj: JsObject, sourceProj: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getReprojTile_(#, #, #, #, #, #)".}
proc setTileGridForProjection*(self: DataTileSource, projection: JsObject, tilegrid: JsObject) {.importjs: "#.setTileGridForProjection(#, #)".}

type
  LoaderOptions* = ref object of JsRoot

proc newLoaderOptions*(): LoaderOptions {.importjs: "({})".}
proc `signal=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.signal = #".}
proc `signal=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.signal = #".}
proc `crossOrigin=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.crossOrigin = #".}
proc `crossOrigin=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.crossOrigin = #".}
proc `crossOrigin=`*(options: LoaderOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `maxY=`*(options: LoaderOptions, value: float) {.importjs: "#.maxY = #".}

type
  DataTileSourceOptions* = ref object of JsRoot

proc newDataTileSourceOptions*(): DataTileSourceOptions {.importjs: "({})".}
proc `loader=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.loader = #".}
proc `loader=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.loader = #".}
proc `attributions=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: DataTileSourceOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: DataTileSourceOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `attributionsCollapsible=`*(options: DataTileSourceOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `maxZoom=`*(options: DataTileSourceOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: DataTileSourceOptions, value: float) {.importjs: "#.minZoom = #".}
proc `tileSize=`*(options: DataTileSourceOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.tileSize = #".}
proc `gutter=`*(options: DataTileSourceOptions, value: float) {.importjs: "#.gutter = #".}
proc `maxResolution=`*(options: DataTileSourceOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `projection=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `tileGrid=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `state=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.state = #".}
proc `wrapX=`*(options: DataTileSourceOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: DataTileSourceOptions, value: float) {.importjs: "#.transition = #".}
proc `bandCount=`*(options: DataTileSourceOptions, value: float) {.importjs: "#.bandCount = #".}
proc `interpolate=`*(options: DataTileSourceOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `crossOrigin=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.crossOrigin = #".}
proc `crossOrigin=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.crossOrigin = #".}
proc `crossOrigin=`*(options: DataTileSourceOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: DataTileSourceOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `key=`*(options: DataTileSourceOptions, value: cstring) {.importjs: "#.key = #".}
proc `zDirection=`*(options: DataTileSourceOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: DataTileSourceOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: DataTileSourceOptions, value: RootRef) {.importjs: "#.zDirection = #".}

proc newDataTileSource*(options: DataTileSourceOptions): DataTileSource {.importjs: "(new olNs_source_DataTile.default(#))".}
