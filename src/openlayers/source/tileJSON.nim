import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileJSON from 'ol/source/TileJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileJSON)".}

type
  TileJSONConfig* = ref object of JsRoot
  TileJSONOptions* = ref object of JsRoot
  TileJSON* = ref object of JsRoot

proc newTileJSONConfig*(): TileJSONConfig {.importjs: "({})".}
proc `name=`*(config: TileJSONConfig, value: cstring) {.importjs: "#.name = #".}
proc `description=`*(
  config: TileJSONConfig, value: cstring
) {.importjs: "#.description = #".}

proc `version=`*(config: TileJSONConfig, value: cstring) {.importjs: "#.version = #".}
proc `attribution=`*(
  config: TileJSONConfig, value: cstring
) {.importjs: "#.attribution = #".}

proc `template=`*(config: TileJSONConfig, value: cstring) {.importjs: "#.template = #".}

proc `legend=`*(config: TileJSONConfig, value: cstring) {.importjs: "#.legend = #".}
proc `scheme=`*(config: TileJSONConfig, value: cstring) {.importjs: "#.scheme = #".}
proc `tiles=`*(config: TileJSONConfig, value: seq[cstring]) {.importjs: "#.tiles = #".}

proc `grids=`*(config: TileJSONConfig, value: seq[cstring]) {.importjs: "#.grids = #".}

proc `minzoom=`*(config: TileJSONConfig, value: float) {.importjs: "#.minzoom = #".}
proc `maxzoom=`*(config: TileJSONConfig, value: float) {.importjs: "#.maxzoom = #".}
proc `bounds=`*(config: TileJSONConfig, value: seq[float]) {.importjs: "#.bounds = #".}

proc `center=`*(config: TileJSONConfig, value: seq[float]) {.importjs: "#.center = #".}

proc newTileJSONOptions*(): TileJSONOptions {.importjs: "({})".}
proc `attributions=`*(
  options: TileJSONOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `cacheSize=`*(
  options: TileJSONOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `crossOrigin=`*(
  options: TileJSONOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `crossOrigin=`*(
  options: TileJSONOptions, value: JsObject
) {.importjs: "#.crossOrigin = #".}

proc `interpolate=`*(
  options: TileJSONOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `jsonp=`*(options: TileJSONOptions, value: bool) {.importjs: "#.jsonp = #".}
proc `reprojectionErrorThreshold=`*(
  options: TileJSONOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `tileJSON=`*(
  options: TileJSONOptions, value: TileJSONConfig
) {.importjs: "#.tileJSON = #".}

proc `tileJSON=`*(
  options: TileJSONOptions, value: JsObject
) {.importjs: "#.tileJSON = #".}

proc `tileLoadFunction=`*(
  options: TileJSONOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `tileSize=`*(options: TileJSONOptions, value: float) {.importjs: "#.tileSize = #".}

proc `tileSize=`*(
  options: TileJSONOptions, value: JsObject
) {.importjs: "#.tileSize = #".}

proc `url=`*(options: TileJSONOptions, value: cstring) {.importjs: "#.url = #".}
proc `wrapX=`*(options: TileJSONOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(
  options: TileJSONOptions, value: float
) {.importjs: "#.transition = #".}

proc `zDirection=`*(
  options: TileJSONOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: TileJSONOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc newTileJSON*(
  options: JsObject
): TileJSON {.importjs: "(new olNs_source_TileJSON.default(#))".}

proc newTileJSON*(
  options: TileJSONOptions
): TileJSON {.importjs: "(new olNs_source_TileJSON.default(#))".}

proc getTileJSON*(self: TileJSON): JsObject {.importjs: "#.getTileJSON()".}
proc handleTileJSONResponse*(
  self: TileJSON, tileJSON: JsObject
) {.importjs: "#.handleTileJSONResponse(#)".}

proc handleTileJSONError*(self: TileJSON) {.importjs: "#.handleTileJSONError()".}
