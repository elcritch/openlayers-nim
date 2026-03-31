import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageWMS from 'ol/source/ImageWMS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageWMS)".}

type
  ImageWMS* = ref object of JsRoot
proc newImageWMS*(options: JsObject = jsUndefined): ImageWMS {.importjs: "(new olNs_source_ImageWMS.default(#))".}
proc getFeatureInfoUrl*(self: ImageWMS, coordinate: JsObject, resolution: float, projection: JsObject, params: JsObject): cstring {.importjs: "#.getFeatureInfoUrl(#, #, #, #)".}
proc getLegendUrl*(self: ImageWMS, resolution: JsObject = jsUndefined, params: JsObject = jsUndefined): cstring {.importjs: "#.getLegendUrl(#, #)".}
proc getParams*(self: ImageWMS): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: ImageWMS): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: ImageWMS): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: ImageWMS, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: ImageWMS, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: ImageWMS, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: ImageWMS, params: JsObject) {.importjs: "#.updateParams(#)".}

type
  ImageWMSOptions* = ref object of JsRoot

proc newImageWMSOptions*(): ImageWMSOptions {.importjs: "({})".}
proc `attributions=`*(options: ImageWMSOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageWMSOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageWMSOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageWMSOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `crossOrigin=`*(options: ImageWMSOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: ImageWMSOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: ImageWMSOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `hidpi=`*(options: ImageWMSOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `serverType=`*(options: ImageWMSOptions, value: JsObject) {.importjs: "#.serverType = #".}
proc `serverType=`*(options: ImageWMSOptions, value: RootRef) {.importjs: "#.serverType = #".}
proc `imageLoadFunction=`*(options: ImageWMSOptions, value: JsObject) {.importjs: "#.imageLoadFunction = #".}
proc `imageLoadFunction=`*(options: ImageWMSOptions, value: RootRef) {.importjs: "#.imageLoadFunction = #".}
proc `interpolate=`*(options: ImageWMSOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `params=`*(options: ImageWMSOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: ImageWMSOptions, value: RootRef) {.importjs: "#.params = #".}
proc `projection=`*(options: ImageWMSOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: ImageWMSOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `ratio=`*(options: ImageWMSOptions, value: float) {.importjs: "#.ratio = #".}
proc `resolutions=`*(options: ImageWMSOptions, value: seq[float]) {.importjs: "#.resolutions = #".}
proc `url=`*(options: ImageWMSOptions, value: cstring) {.importjs: "#.url = #".}

proc newImageWMS*(options: ImageWMSOptions): ImageWMS {.importjs: "(new olNs_source_ImageWMS.default(#))".}
