import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_UrlTile from 'ol/source/UrlTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_UrlTile)".}

type
  UrlTile* = ref object of JsRoot
proc newUrlTile*(options: JsObject): UrlTile {.importjs: "(new olNs_source_UrlTile.default(#))".}
proc tileUrlFunction*(self: UrlTile, tileCoord: JsObject, pixelRatio: float, projection: JsObject): cstring {.importjs: "#.tileUrlFunction(#, #, #)".}
proc getTileLoadFunction*(self: UrlTile): JsObject {.importjs: "#.getTileLoadFunction()".}
proc getTileUrlFunction*(self: UrlTile): JsObject {.importjs: "#.getTileUrlFunction()".}
proc getUrls*(self: UrlTile): JsObject {.importjs: "#.getUrls()".}
proc handleTileChange*(self: UrlTile, event: JsObject) {.importjs: "#.handleTileChange(#)".}
proc setTileLoadFunction*(self: UrlTile, tileLoadFunction: JsObject) {.importjs: "#.setTileLoadFunction(#)".}
proc setTileUrlFunction*(self: UrlTile, tileUrlFunction: JsObject, key: JsObject = jsUndefined) {.importjs: "#.setTileUrlFunction(#, #)".}
proc setUrl*(self: UrlTile, url: cstring) {.importjs: "#.setUrl(#)".}
proc setUrls*(self: UrlTile, urls: seq[cstring]) {.importjs: "#.setUrls(#)".}

type
  UrlTileOptions* = ref object of JsRoot

proc newUrlTileOptions*(): UrlTileOptions {.importjs: "({})".}
proc `attributions=`*(options: UrlTileOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: UrlTileOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: UrlTileOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: UrlTileOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `attributionsCollapsible=`*(options: UrlTileOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `cacheSize=`*(options: UrlTileOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `projection=`*(options: UrlTileOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: UrlTileOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `state=`*(options: UrlTileOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: UrlTileOptions, value: RootRef) {.importjs: "#.state = #".}
proc `tileGrid=`*(options: UrlTileOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: UrlTileOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `tileLoadFunction=`*(options: UrlTileOptions, value: JsObject) {.importjs: "#.tileLoadFunction = #".}
proc `tileLoadFunction=`*(options: UrlTileOptions, value: RootRef) {.importjs: "#.tileLoadFunction = #".}
proc `tilePixelRatio=`*(options: UrlTileOptions, value: float) {.importjs: "#.tilePixelRatio = #".}
proc `tileUrlFunction=`*(options: UrlTileOptions, value: JsObject) {.importjs: "#.tileUrlFunction = #".}
proc `tileUrlFunction=`*(options: UrlTileOptions, value: RootRef) {.importjs: "#.tileUrlFunction = #".}
proc `tileUrlFunction=`*(options: UrlTileOptions, value: cstring) {.importjs: "#.tileUrlFunction = #".}
proc `tileUrlFunction=`*(options: UrlTileOptions, value: seq[cstring]) {.importjs: "#.tileUrlFunction = #".}
proc `url=`*(options: UrlTileOptions, value: cstring) {.importjs: "#.url = #".}
proc `urls=`*(options: UrlTileOptions, value: seq[cstring]) {.importjs: "#.urls = #".}
proc `wrapX=`*(options: UrlTileOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: UrlTileOptions, value: float) {.importjs: "#.transition = #".}
proc `key=`*(options: UrlTileOptions, value: cstring) {.importjs: "#.key = #".}
proc `zDirection=`*(options: UrlTileOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: UrlTileOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: UrlTileOptions, value: RootRef) {.importjs: "#.zDirection = #".}
proc `interpolate=`*(options: UrlTileOptions, value: bool) {.importjs: "#.interpolate = #".}

proc newUrlTile*(options: UrlTileOptions): UrlTile {.importjs: "(new olNs_source_UrlTile.default(#))".}
