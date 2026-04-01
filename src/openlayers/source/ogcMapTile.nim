import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_OGCMapTile from 'ol/source/OGCMapTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OGCMapTile)".}

type
  OGCMapTile* = ref object of JsRoot
proc newOGCMapTile*(options: JsObject): OGCMapTile {.importjs: "(new olNs_source_OGCMapTile.default(#))".}

type
  OGCMapTileOptions* = ref object of JsRoot

proc newOGCMapTileOptions*(): OGCMapTileOptions {.importjs: "({})".}
proc `url=`*(options: OGCMapTileOptions, value: cstring) {.importjs: "#.url = #".}
proc `context=`*(options: OGCMapTileOptions, value: JsObject) {.importjs: "#.context = #".}
proc `context=`*(options: OGCMapTileOptions, value: RootRef) {.importjs: "#.context = #".}
proc `mediaType=`*(options: OGCMapTileOptions, value: cstring) {.importjs: "#.mediaType = #".}
proc `projection=`*(options: OGCMapTileOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: OGCMapTileOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `attributions=`*(options: OGCMapTileOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: OGCMapTileOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: OGCMapTileOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: OGCMapTileOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `cacheSize=`*(options: OGCMapTileOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(options: OGCMapTileOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: OGCMapTileOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: OGCMapTileOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: OGCMapTileOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `interpolate=`*(options: OGCMapTileOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `reprojectionErrorThreshold=`*(options: OGCMapTileOptions, value: float) {.importjs: "#.reprojectionErrorThreshold = #".}
proc `tileLoadFunction=`*(options: OGCMapTileOptions, value: JsObject) {.importjs: "#.tileLoadFunction = #".}
proc `tileLoadFunction=`*(options: OGCMapTileOptions, value: RootRef) {.importjs: "#.tileLoadFunction = #".}
proc `wrapX=`*(options: OGCMapTileOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: OGCMapTileOptions, value: float) {.importjs: "#.transition = #".}
proc `collections=`*(options: OGCMapTileOptions, value: seq[cstring]) {.importjs: "#.collections = #".}

proc newOGCMapTile*(options: OGCMapTileOptions): OGCMapTile {.importjs: "(new olNs_source_OGCMapTile.default(#))".}
