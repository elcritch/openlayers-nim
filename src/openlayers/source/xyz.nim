import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_XYZ from 'ol/source/XYZ.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_XYZ)".}

type
  XYZ* = ref object of JsRoot
proc newXYZ*(options: JsObject = jsUndefined): XYZ {.importjs: "(new olNs_source_XYZ.default(#))".}

type
  XYZOptions* = ref object of JsRoot

proc newXYZOptions*(): XYZOptions {.importjs: "({})".}
proc `attributions=`*(options: XYZOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: XYZOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: XYZOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: XYZOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `attributionsCollapsible=`*(options: XYZOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `cacheSize=`*(options: XYZOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(options: XYZOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: XYZOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: XYZOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: XYZOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `interpolate=`*(options: XYZOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `projection=`*(options: XYZOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: XYZOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `reprojectionErrorThreshold=`*(options: XYZOptions, value: float) {.importjs: "#.reprojectionErrorThreshold = #".}
proc `maxZoom=`*(options: XYZOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: XYZOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxResolution=`*(options: XYZOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `tileGrid=`*(options: XYZOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: XYZOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `tileLoadFunction=`*(options: XYZOptions, value: JsObject) {.importjs: "#.tileLoadFunction = #".}
proc `tileLoadFunction=`*(options: XYZOptions, value: RootRef) {.importjs: "#.tileLoadFunction = #".}
proc `tilePixelRatio=`*(options: XYZOptions, value: float) {.importjs: "#.tilePixelRatio = #".}
proc `tileSize=`*(options: XYZOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: XYZOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: XYZOptions, value: RootRef) {.importjs: "#.tileSize = #".}
proc `gutter=`*(options: XYZOptions, value: float) {.importjs: "#.gutter = #".}
proc `tileUrlFunction=`*(options: XYZOptions, value: JsObject) {.importjs: "#.tileUrlFunction = #".}
proc `tileUrlFunction=`*(options: XYZOptions, value: RootRef) {.importjs: "#.tileUrlFunction = #".}
proc `tileUrlFunction=`*(options: XYZOptions, value: cstring) {.importjs: "#.tileUrlFunction = #".}
proc `tileUrlFunction=`*(options: XYZOptions, value: seq[cstring]) {.importjs: "#.tileUrlFunction = #".}
proc `url=`*(options: XYZOptions, value: cstring) {.importjs: "#.url = #".}
proc `urls=`*(options: XYZOptions, value: seq[cstring]) {.importjs: "#.urls = #".}
proc `wrapX=`*(options: XYZOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: XYZOptions, value: float) {.importjs: "#.transition = #".}
proc `zDirection=`*(options: XYZOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: XYZOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: XYZOptions, value: RootRef) {.importjs: "#.zDirection = #".}

proc newXYZ*(options: XYZOptions): XYZ {.importjs: "(new olNs_source_XYZ.default(#))".}
