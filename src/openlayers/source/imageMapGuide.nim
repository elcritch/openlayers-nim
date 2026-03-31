import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageMapGuide from 'ol/source/ImageMapGuide.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageMapGuide)".}

type
  ImageMapGuide* = ref object of JsRoot
proc newImageMapGuide*(options: JsObject): ImageMapGuide {.importjs: "(new olNs_source_ImageMapGuide.default(#))".}
proc getParams*(self: ImageMapGuide): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: ImageMapGuide): JsObject {.importjs: "#.getImageLoadFunction()".}
proc setParams*(self: ImageMapGuide, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: ImageMapGuide, params: JsObject) {.importjs: "#.updateParams(#)".}
proc setImageLoadFunction*(self: ImageMapGuide, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}

type
  ImageMapGuideOptions* = ref object of JsRoot

proc newImageMapGuideOptions*(): ImageMapGuideOptions {.importjs: "({})".}
proc `url=`*(options: ImageMapGuideOptions, value: cstring) {.importjs: "#.url = #".}
proc `crossOrigin=`*(options: ImageMapGuideOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: ImageMapGuideOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: ImageMapGuideOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `displayDpi=`*(options: ImageMapGuideOptions, value: float) {.importjs: "#.displayDpi = #".}
proc `metersPerUnit=`*(options: ImageMapGuideOptions, value: float) {.importjs: "#.metersPerUnit = #".}
proc `hidpi=`*(options: ImageMapGuideOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `useOverlay=`*(options: ImageMapGuideOptions, value: bool) {.importjs: "#.useOverlay = #".}
proc `projection=`*(options: ImageMapGuideOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: ImageMapGuideOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `ratio=`*(options: ImageMapGuideOptions, value: float) {.importjs: "#.ratio = #".}
proc `resolutions=`*(options: ImageMapGuideOptions, value: seq[float]) {.importjs: "#.resolutions = #".}
proc `imageLoadFunction=`*(options: ImageMapGuideOptions, value: JsObject) {.importjs: "#.imageLoadFunction = #".}
proc `imageLoadFunction=`*(options: ImageMapGuideOptions, value: RootRef) {.importjs: "#.imageLoadFunction = #".}
proc `interpolate=`*(options: ImageMapGuideOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `params=`*(options: ImageMapGuideOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: ImageMapGuideOptions, value: RootRef) {.importjs: "#.params = #".}

proc newImageMapGuide*(options: ImageMapGuideOptions): ImageMapGuide {.importjs: "(new olNs_source_ImageMapGuide.default(#))".}
