import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileWMS from 'ol/source/TileWMS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileWMS)".}

type TileWMS* = ref object of JsRoot
proc newTileWMS*(
  options: JsObject = jsUndefined
): TileWMS {.importjs: "(new olNs_source_TileWMS.default(#))".}

proc getFeatureInfoUrl*(
  self: TileWMS,
  coordinate: JsObject,
  resolution: float,
  projection: JsObject,
  params: JsObject,
): cstring {.importjs: "#.getFeatureInfoUrl(#, #, #, #)".}

proc getLegendUrl*(
  self: TileWMS, resolution: JsObject = jsUndefined, params: JsObject = jsUndefined
): cstring {.importjs: "#.getLegendUrl(#, #)".}

proc getParams*(self: TileWMS): JsObject {.importjs: "#.getParams()".}
proc setParams*(self: TileWMS, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: TileWMS, params: JsObject) {.importjs: "#.updateParams(#)".}

type TileWMSOptions* = ref object of JsRoot

proc newTileWMSOptions*(): TileWMSOptions {.importjs: "({})".}
proc `attributions=`*(
  options: TileWMSOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: TileWMSOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `attributionsCollapsible=`*(
  options: TileWMSOptions, value: bool
) {.importjs: "#.attributionsCollapsible = #".}

proc `cacheSize=`*(
  options: TileWMSOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `crossOrigin=`*(
  options: TileWMSOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `interpolate=`*(
  options: TileWMSOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `params=`*(options: TileWMSOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: TileWMSOptions, value: RootRef) {.importjs: "#.params = #".}
proc `gutter=`*(options: TileWMSOptions, value: float) {.importjs: "#.gutter = #".}
proc `hidpi=`*(options: TileWMSOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `projection=`*(
  options: TileWMSOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: TileWMSOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `reprojectionErrorThreshold=`*(
  options: TileWMSOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `tileClass=`*(
  options: TileWMSOptions, value: JsObject
) {.importjs: "#.tileClass = #".}

proc `tileClass=`*(
  options: TileWMSOptions, value: RootRef
) {.importjs: "#.tileClass = #".}

proc `tileGrid=`*(
  options: TileWMSOptions, value: JsObject
) {.importjs: "#.tileGrid = #".}

proc `tileGrid=`*(
  options: TileWMSOptions, value: RootRef
) {.importjs: "#.tileGrid = #".}

proc `serverType=`*(
  options: TileWMSOptions, value: JsObject
) {.importjs: "#.serverType = #".}

proc `serverType=`*(
  options: TileWMSOptions, value: RootRef
) {.importjs: "#.serverType = #".}

proc `tileLoadFunction=`*(
  options: TileWMSOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `tileLoadFunction=`*(
  options: TileWMSOptions, value: RootRef
) {.importjs: "#.tileLoadFunction = #".}

proc `url=`*(options: TileWMSOptions, value: cstring) {.importjs: "#.url = #".}
proc `urls=`*(options: TileWMSOptions, value: seq[cstring]) {.importjs: "#.urls = #".}
proc `wrapX=`*(options: TileWMSOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(
  options: TileWMSOptions, value: float
) {.importjs: "#.transition = #".}

proc `zDirection=`*(
  options: TileWMSOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: TileWMSOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: TileWMSOptions, value: RootRef
) {.importjs: "#.zDirection = #".}

proc newTileWMS*(
  options: TileWMSOptions
): TileWMS {.importjs: "(new olNs_source_TileWMS.default(#))".}
