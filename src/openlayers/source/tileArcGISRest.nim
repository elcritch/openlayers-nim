import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit: "import * as olNs_source_TileArcGISRest from 'ol/source/TileArcGISRest.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileArcGISRest)".}

type TileArcGISRest* = ref object of JsRoot
proc newTileArcGISRest*(
  options: JsObject = jsUndefined
): TileArcGISRest {.importjs: "(new olNs_source_TileArcGISRest.default(#))".}

proc getParams*(self: TileArcGISRest): JsObject {.importjs: "#.getParams()".}
proc setParams*(self: TileArcGISRest, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(
  self: TileArcGISRest, params: JsObject
) {.importjs: "#.updateParams(#)".}

type TileArcGISRestOptions* = ref object of JsRoot

proc newTileArcGISRestOptions*(): TileArcGISRestOptions {.importjs: "({})".}
proc `attributions=`*(
  options: TileArcGISRestOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: TileArcGISRestOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `cacheSize=`*(
  options: TileArcGISRestOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `crossOrigin=`*(
  options: TileArcGISRestOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `referrerPolicy=`*(
  options: TileArcGISRestOptions, value: JsObject
) {.importjs: "#.referrerPolicy = #".}

proc `referrerPolicy=`*(
  options: TileArcGISRestOptions, value: RootRef
) {.importjs: "#.referrerPolicy = #".}

proc `interpolate=`*(
  options: TileArcGISRestOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `params=`*(
  options: TileArcGISRestOptions, value: JsObject
) {.importjs: "#.params = #".}

proc `params=`*(
  options: TileArcGISRestOptions, value: RootRef
) {.importjs: "#.params = #".}

proc `hidpi=`*(options: TileArcGISRestOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `tileGrid=`*(
  options: TileArcGISRestOptions, value: JsObject
) {.importjs: "#.tileGrid = #".}

proc `tileGrid=`*(
  options: TileArcGISRestOptions, value: RootRef
) {.importjs: "#.tileGrid = #".}

proc `projection=`*(
  options: TileArcGISRestOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: TileArcGISRestOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `reprojectionErrorThreshold=`*(
  options: TileArcGISRestOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `tileLoadFunction=`*(
  options: TileArcGISRestOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `tileLoadFunction=`*(
  options: TileArcGISRestOptions, value: RootRef
) {.importjs: "#.tileLoadFunction = #".}

proc `url=`*(options: TileArcGISRestOptions, value: cstring) {.importjs: "#.url = #".}
proc `wrapX=`*(options: TileArcGISRestOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(
  options: TileArcGISRestOptions, value: float
) {.importjs: "#.transition = #".}

proc `urls=`*(
  options: TileArcGISRestOptions, value: seq[cstring]
) {.importjs: "#.urls = #".}

proc `zDirection=`*(
  options: TileArcGISRestOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: TileArcGISRestOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: TileArcGISRestOptions, value: RootRef
) {.importjs: "#.zDirection = #".}

proc newTileArcGISRest*(
  options: TileArcGISRestOptions
): TileArcGISRest {.importjs: "(new olNs_source_TileArcGISRest.default(#))".}
