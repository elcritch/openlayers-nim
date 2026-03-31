import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageTile from 'ol/source/ImageTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageTile)".}

type
  ImageTileSource* = ref object of JsRoot
proc newImageTileSource*(options: JsObject = jsUndefined): ImageTileSource {.importjs: "(new olNs_source_ImageTile.default(#))".}
proc setUrl*(self: ImageTileSource, url: JsObject) {.importjs: "#.setUrl(#)".}

type
  ImageTileSourceOptions* = ref object of JsRoot

proc newImageTileSourceOptions*(): ImageTileSourceOptions {.importjs: "({})".}
proc `url=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.url = #".}
proc `url=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.url = #".}
proc `url=`*(options: ImageTileSourceOptions, value: cstring) {.importjs: "#.url = #".}
proc `url=`*(options: ImageTileSourceOptions, value: seq[cstring]) {.importjs: "#.url = #".}
proc `loader=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.loader = #".}
proc `loader=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.loader = #".}
proc `attributions=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageTileSourceOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageTileSourceOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `attributionsCollapsible=`*(options: ImageTileSourceOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `maxZoom=`*(options: ImageTileSourceOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: ImageTileSourceOptions, value: float) {.importjs: "#.minZoom = #".}
proc `tileSize=`*(options: ImageTileSourceOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.tileSize = #".}
proc `gutter=`*(options: ImageTileSourceOptions, value: float) {.importjs: "#.gutter = #".}
proc `maxResolution=`*(options: ImageTileSourceOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `projection=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `tileGrid=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `state=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.state = #".}
proc `wrapX=`*(options: ImageTileSourceOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: ImageTileSourceOptions, value: float) {.importjs: "#.transition = #".}
proc `interpolate=`*(options: ImageTileSourceOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `crossOrigin=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.crossOrigin = #".}
proc `crossOrigin=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.crossOrigin = #".}
proc `crossOrigin=`*(options: ImageTileSourceOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: ImageTileSourceOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `zDirection=`*(options: ImageTileSourceOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: ImageTileSourceOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: ImageTileSourceOptions, value: RootRef) {.importjs: "#.zDirection = #".}

proc newImageTileSource*(options: ImageTileSourceOptions): ImageTileSource {.importjs: "(new olNs_source_ImageTile.default(#))".}
