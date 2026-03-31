import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_BingMaps from 'ol/source/BingMaps.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_BingMaps)".}

type
  BingMaps* = ref object of JsRoot
proc newBingMaps*(options: JsObject): BingMaps {.importjs: "(new olNs_source_BingMaps.default(#))".}
proc getApiKey*(self: BingMaps): cstring {.importjs: "#.getApiKey()".}
proc getImagerySet*(self: BingMaps): cstring {.importjs: "#.getImagerySet()".}
proc handleImageryMetadataResponse*(self: BingMaps, response: JsObject) {.importjs: "#.handleImageryMetadataResponse(#)".}

proc quadKey*(tileCoord: JsObject): cstring {.importjs: "olNs_source_BingMaps.quadKey(#)".}

type
  BingMapsOptions* = ref object of JsRoot

proc newBingMapsOptions*(): BingMapsOptions {.importjs: "({})".}
proc `cacheSize=`*(options: BingMapsOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `hidpi=`*(options: BingMapsOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `culture=`*(options: BingMapsOptions, value: cstring) {.importjs: "#.culture = #".}
proc `key=`*(options: BingMapsOptions, value: cstring) {.importjs: "#.key = #".}
proc `imagerySet=`*(options: BingMapsOptions, value: cstring) {.importjs: "#.imagerySet = #".}
proc `interpolate=`*(options: BingMapsOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `maxZoom=`*(options: BingMapsOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `reprojectionErrorThreshold=`*(options: BingMapsOptions, value: float) {.importjs: "#.reprojectionErrorThreshold = #".}
proc `tileLoadFunction=`*(options: BingMapsOptions, value: JsObject) {.importjs: "#.tileLoadFunction = #".}
proc `tileLoadFunction=`*(options: BingMapsOptions, value: RootRef) {.importjs: "#.tileLoadFunction = #".}
proc `wrapX=`*(options: BingMapsOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: BingMapsOptions, value: float) {.importjs: "#.transition = #".}
proc `zDirection=`*(options: BingMapsOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: BingMapsOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: BingMapsOptions, value: RootRef) {.importjs: "#.zDirection = #".}
proc `placeholderTiles=`*(options: BingMapsOptions, value: bool) {.importjs: "#.placeholderTiles = #".}
proc `url=`*(options: BingMapsOptions, value: cstring) {.importjs: "#.url = #".}

proc newBingMaps*(options: BingMapsOptions): BingMaps {.importjs: "(new olNs_source_BingMaps.default(#))".}
