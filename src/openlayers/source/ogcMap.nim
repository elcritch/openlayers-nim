import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OGCMap from 'ol/source/OGCMap.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OGCMap)".}

type
  OGCMap* = ref object of JsRoot
proc newOGCMap*(options: JsObject = jsUndefined): OGCMap {.importjs: "(new olNs_source_OGCMap.default(#))".}
proc getParams*(self: OGCMap): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: OGCMap): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: OGCMap): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: OGCMap, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: OGCMap, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: OGCMap, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: OGCMap, params: JsObject) {.importjs: "#.updateParams(#)".}

type
  OGCMapOptions* = ref object of JsRoot

proc newOGCMapOptions*(): OGCMapOptions {.importjs: "({})".}
proc `attributions=`*(options: OGCMapOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: OGCMapOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: OGCMapOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: OGCMapOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `crossOrigin=`*(options: OGCMapOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: OGCMapOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: OGCMapOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: OGCMapOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `hidpi=`*(options: OGCMapOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `imageLoadFunction=`*(options: OGCMapOptions, value: JsObject) {.importjs: "#.imageLoadFunction = #".}
proc `imageLoadFunction=`*(options: OGCMapOptions, value: RootRef) {.importjs: "#.imageLoadFunction = #".}
proc `interpolate=`*(options: OGCMapOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `params=`*(options: OGCMapOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: OGCMapOptions, value: RootRef) {.importjs: "#.params = #".}
proc `projection=`*(options: OGCMapOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: OGCMapOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `ratio=`*(options: OGCMapOptions, value: float) {.importjs: "#.ratio = #".}
proc `resolutions=`*(options: OGCMapOptions, value: seq[float]) {.importjs: "#.resolutions = #".}
proc `url=`*(options: OGCMapOptions, value: cstring) {.importjs: "#.url = #".}

proc newOGCMap*(options: OGCMapOptions): OGCMap {.importjs: "(new olNs_source_OGCMap.default(#))".}
