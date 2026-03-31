import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileImage from 'ol/source/TileImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileImage)".}

type
  TileImage* = ref object of JsRoot
proc newTileImage*(options: JsObject): TileImage {.importjs: "(new olNs_source_TileImage.default(#))".}
proc getGutter*(self: TileImage): float {.importjs: "#.getGutter()".}
proc getTileInternal*(self: TileImage, z: float, x: float, y: float, pixelRatio: float, projection: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getTileInternal(#, #, #, #, #, #)".}
proc setRenderReprojectionEdges*(self: TileImage, render: bool) {.importjs: "#.setRenderReprojectionEdges(#)".}
proc setTileGridForProjection*(self: TileImage, projection: JsObject, tilegrid: JsObject) {.importjs: "#.setTileGridForProjection(#, #)".}

proc defaultTileLoadFunction*(imageTile: JsObject, src: cstring) {.importjs: "olNs_source_TileImage.defaultTileLoadFunction(#, #)".}

type
  TileImageOptions* = ref object of JsRoot

proc newTileImageOptions*(): TileImageOptions {.importjs: "({})".}
proc `attributions=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileImageOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileImageOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `attributionsCollapsible=`*(options: TileImageOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `cacheSize=`*(options: TileImageOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(options: TileImageOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `interpolate=`*(options: TileImageOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `projection=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `reprojectionErrorThreshold=`*(options: TileImageOptions, value: float) {.importjs: "#.reprojectionErrorThreshold = #".}
proc `state=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.state = #".}
proc `tileClass=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.tileClass = #".}
proc `tileClass=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.tileClass = #".}
proc `tileGrid=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `tileLoadFunction=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.tileLoadFunction = #".}
proc `tileLoadFunction=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.tileLoadFunction = #".}
proc `tilePixelRatio=`*(options: TileImageOptions, value: float) {.importjs: "#.tilePixelRatio = #".}
proc `tileUrlFunction=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.tileUrlFunction = #".}
proc `tileUrlFunction=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.tileUrlFunction = #".}
proc `url=`*(options: TileImageOptions, value: cstring) {.importjs: "#.url = #".}
proc `urls=`*(options: TileImageOptions, value: seq[cstring]) {.importjs: "#.urls = #".}
proc `wrapX=`*(options: TileImageOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: TileImageOptions, value: float) {.importjs: "#.transition = #".}
proc `key=`*(options: TileImageOptions, value: cstring) {.importjs: "#.key = #".}
proc `zDirection=`*(options: TileImageOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: TileImageOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: TileImageOptions, value: RootRef) {.importjs: "#.zDirection = #".}

proc newTileImage*(options: TileImageOptions): TileImage {.importjs: "(new olNs_source_TileImage.default(#))".}
