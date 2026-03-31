import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_XYZ from 'ol/source/XYZ.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_XYZ)".}

type
  OlXYZOptions* = ref object of JsRoot
  OlXYZ* = ref object of JsRoot

proc newOlXYZOptions*(): OlXYZOptions {.importjs: "({})".}
proc `attributions=`*(
  options: OlXYZOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributionsCollapsible=`*(
  options: OlXYZOptions, value: bool
) {.importjs: "#.attributionsCollapsible = #".}

proc `cacheSize=`*(options: OlXYZOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(
  options: OlXYZOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `crossOrigin=`*(
  options: OlXYZOptions, value: JsObject
) {.importjs: "#.crossOrigin = #".}

proc `referrerPolicy=`*(
  options: OlXYZOptions, value: cstring
) {.importjs: "#.referrerPolicy = #".}

proc `interpolate=`*(
  options: OlXYZOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `projection=`*(
  options: OlXYZOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `reprojectionErrorThreshold=`*(
  options: OlXYZOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `maxZoom=`*(options: OlXYZOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: OlXYZOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxResolution=`*(
  options: OlXYZOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `tileGrid=`*(options: OlXYZOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileLoadFunction=`*(
  options: OlXYZOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `tilePixelRatio=`*(
  options: OlXYZOptions, value: float
) {.importjs: "#.tilePixelRatio = #".}

proc `tileSize=`*(options: OlXYZOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: OlXYZOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `gutter=`*(options: OlXYZOptions, value: float) {.importjs: "#.gutter = #".}
proc `tileUrlFunction=`*(
  options: OlXYZOptions, value: JsObject
) {.importjs: "#.tileUrlFunction = #".}

proc `url=`*(options: OlXYZOptions, value: cstring) {.importjs: "#.url = #".}
proc `urls=`*(options: OlXYZOptions, value: seq[cstring]) {.importjs: "#.urls = #".}
proc `urls=`*(options: OlXYZOptions, value: JsObject) {.importjs: "#.urls = #".}
proc `wrapX=`*(options: OlXYZOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(
  options: OlXYZOptions, value: float
) {.importjs: "#.transition = #".}

proc `zDirection=`*(
  options: OlXYZOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: OlXYZOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc newOlXYZ*(
  options: JsObject = jsUndefined
): OlXYZ {.importjs: "(new olNs_source_XYZ.default(#))".}

proc newOlXYZ*(
  options: OlXYZOptions
): OlXYZ {.importjs: "(new olNs_source_XYZ.default(#))".}
