import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageArcGISRest from 'ol/source/ImageArcGISRest.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageArcGISRest)".}

type
  ImageArcGISRest* = ref object of JsRoot
proc newImageArcGISRest*(options: JsObject = jsUndefined): ImageArcGISRest {.importjs: "(new olNs_source_ImageArcGISRest.default(#))".}
proc getParams*(self: ImageArcGISRest): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: ImageArcGISRest): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: ImageArcGISRest): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: ImageArcGISRest, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: ImageArcGISRest, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: ImageArcGISRest, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: ImageArcGISRest, params: JsObject) {.importjs: "#.updateParams(#)".}

type
  ImageArcGISRestOptions* = ref object of JsRoot

proc newImageArcGISRestOptions*(): ImageArcGISRestOptions {.importjs: "({})".}
proc `attributions=`*(options: ImageArcGISRestOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageArcGISRestOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageArcGISRestOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageArcGISRestOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `crossOrigin=`*(options: ImageArcGISRestOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: ImageArcGISRestOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: ImageArcGISRestOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: ImageArcGISRestOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `hidpi=`*(options: ImageArcGISRestOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `imageLoadFunction=`*(options: ImageArcGISRestOptions, value: JsObject) {.importjs: "#.imageLoadFunction = #".}
proc `imageLoadFunction=`*(options: ImageArcGISRestOptions, value: RootRef) {.importjs: "#.imageLoadFunction = #".}
proc `interpolate=`*(options: ImageArcGISRestOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `params=`*(options: ImageArcGISRestOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: ImageArcGISRestOptions, value: RootRef) {.importjs: "#.params = #".}
proc `projection=`*(options: ImageArcGISRestOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: ImageArcGISRestOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `ratio=`*(options: ImageArcGISRestOptions, value: float) {.importjs: "#.ratio = #".}
proc `resolutions=`*(options: ImageArcGISRestOptions, value: seq[float]) {.importjs: "#.resolutions = #".}
proc `url=`*(options: ImageArcGISRestOptions, value: cstring) {.importjs: "#.url = #".}

proc newImageArcGISRest*(options: ImageArcGISRestOptions): ImageArcGISRest {.importjs: "(new olNs_source_ImageArcGISRest.default(#))".}
