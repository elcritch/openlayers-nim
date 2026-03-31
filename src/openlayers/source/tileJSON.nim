import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileJSON from 'ol/source/TileJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileJSON)".}

type
  TileJSON* = ref object of JsRoot
proc newTileJSON*(options: JsObject): TileJSON {.importjs: "(new olNs_source_TileJSON.default(#))".}
proc getTileJSON*(self: TileJSON): JsObject {.importjs: "#.getTileJSON()".}
proc handleTileJSONResponse*(self: TileJSON, tileJSON: JsObject) {.importjs: "#.handleTileJSONResponse(#)".}
proc handleTileJSONError*(self: TileJSON) {.importjs: "#.handleTileJSONError()".}

type
  TileJSONOptions* = ref object of JsRoot

proc newTileJSONOptions*(): TileJSONOptions {.importjs: "({})".}
proc `attributions=`*(options: TileJSONOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileJSONOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileJSONOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: TileJSONOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `cacheSize=`*(options: TileJSONOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(options: TileJSONOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `interpolate=`*(options: TileJSONOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `jsonp=`*(options: TileJSONOptions, value: bool) {.importjs: "#.jsonp = #".}
proc `reprojectionErrorThreshold=`*(options: TileJSONOptions, value: float) {.importjs: "#.reprojectionErrorThreshold = #".}
proc `tileJSON=`*(options: TileJSONOptions, value: JsObject) {.importjs: "#.tileJSON = #".}
proc `tileJSON=`*(options: TileJSONOptions, value: RootRef) {.importjs: "#.tileJSON = #".}
proc `tileLoadFunction=`*(options: TileJSONOptions, value: JsObject) {.importjs: "#.tileLoadFunction = #".}
proc `tileLoadFunction=`*(options: TileJSONOptions, value: RootRef) {.importjs: "#.tileLoadFunction = #".}
proc `tileSize=`*(options: TileJSONOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: TileJSONOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: TileJSONOptions, value: RootRef) {.importjs: "#.tileSize = #".}
proc `url=`*(options: TileJSONOptions, value: cstring) {.importjs: "#.url = #".}
proc `wrapX=`*(options: TileJSONOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: TileJSONOptions, value: float) {.importjs: "#.transition = #".}
proc `zDirection=`*(options: TileJSONOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: TileJSONOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: TileJSONOptions, value: RootRef) {.importjs: "#.zDirection = #".}

proc newTileJSON*(options: TileJSONOptions): TileJSON {.importjs: "(new olNs_source_TileJSON.default(#))".}
