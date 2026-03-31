import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileJSON from 'ol/source/TileJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileJSON)".}

type
  OlTileJSONConfig* = ref object of JsRoot
  OlTileJSONOptions* = ref object of JsRoot
  OlTileJSON* = ref object of JsRoot

proc newOlTileJSONConfig*(): OlTileJSONConfig {.importjs: "({})".}
proc `name=`*(config: OlTileJSONConfig, value: cstring) {.importjs: "#.name = #".}
proc `description=`*(
  config: OlTileJSONConfig, value: cstring
) {.importjs: "#.description = #".}

proc `version=`*(config: OlTileJSONConfig, value: cstring) {.importjs: "#.version = #".}
proc `attribution=`*(
  config: OlTileJSONConfig, value: cstring
) {.importjs: "#.attribution = #".}

proc `template=`*(
  config: OlTileJSONConfig, value: cstring
) {.importjs: "#.template = #".}

proc `legend=`*(config: OlTileJSONConfig, value: cstring) {.importjs: "#.legend = #".}
proc `scheme=`*(config: OlTileJSONConfig, value: cstring) {.importjs: "#.scheme = #".}
proc `tiles=`*(
  config: OlTileJSONConfig, value: seq[cstring]
) {.importjs: "#.tiles = #".}

proc `grids=`*(
  config: OlTileJSONConfig, value: seq[cstring]
) {.importjs: "#.grids = #".}

proc `minzoom=`*(config: OlTileJSONConfig, value: float) {.importjs: "#.minzoom = #".}
proc `maxzoom=`*(config: OlTileJSONConfig, value: float) {.importjs: "#.maxzoom = #".}
proc `bounds=`*(
  config: OlTileJSONConfig, value: seq[float]
) {.importjs: "#.bounds = #".}

proc `center=`*(
  config: OlTileJSONConfig, value: seq[float]
) {.importjs: "#.center = #".}

proc newOlTileJSONOptions*(): OlTileJSONOptions {.importjs: "({})".}
proc `attributions=`*(
  options: OlTileJSONOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `cacheSize=`*(
  options: OlTileJSONOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `crossOrigin=`*(
  options: OlTileJSONOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `crossOrigin=`*(
  options: OlTileJSONOptions, value: JsObject
) {.importjs: "#.crossOrigin = #".}

proc `interpolate=`*(
  options: OlTileJSONOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `jsonp=`*(options: OlTileJSONOptions, value: bool) {.importjs: "#.jsonp = #".}
proc `reprojectionErrorThreshold=`*(
  options: OlTileJSONOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `tileJSON=`*(
  options: OlTileJSONOptions, value: OlTileJSONConfig
) {.importjs: "#.tileJSON = #".}

proc `tileJSON=`*(
  options: OlTileJSONOptions, value: JsObject
) {.importjs: "#.tileJSON = #".}

proc `tileLoadFunction=`*(
  options: OlTileJSONOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `tileSize=`*(
  options: OlTileJSONOptions, value: float
) {.importjs: "#.tileSize = #".}

proc `tileSize=`*(
  options: OlTileJSONOptions, value: JsObject
) {.importjs: "#.tileSize = #".}

proc `url=`*(options: OlTileJSONOptions, value: cstring) {.importjs: "#.url = #".}
proc `wrapX=`*(options: OlTileJSONOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(
  options: OlTileJSONOptions, value: float
) {.importjs: "#.transition = #".}

proc `zDirection=`*(
  options: OlTileJSONOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: OlTileJSONOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc newOlTileJSON*(
  options: JsObject
): OlTileJSON {.importjs: "(new olNs_source_TileJSON.default(#))".}

proc newOlTileJSON*(
  options: OlTileJSONOptions
): OlTileJSON {.importjs: "(new olNs_source_TileJSON.default(#))".}

proc getTileJSON*(self: OlTileJSON): JsObject {.importjs: "#.getTileJSON()".}
proc handleTileJSONResponse*(
  self: OlTileJSON, tileJSON: JsObject
) {.importjs: "#.handleTileJSONResponse(#)".}

proc handleTileJSONError*(self: OlTileJSON) {.importjs: "#.handleTileJSONError()".}
