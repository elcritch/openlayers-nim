import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_Zoomify from 'ol/source/Zoomify.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Zoomify)".}

type
  Zoomify* = ref object of JsRoot
proc newZoomify*(options: JsObject): Zoomify {.importjs: "(new olNs_source_Zoomify.default(#))".}

type
  ZoomifyOptions* = ref object of JsRoot

proc newZoomifyOptions*(): ZoomifyOptions {.importjs: "({})".}
proc `attributions=`*(options: ZoomifyOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ZoomifyOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ZoomifyOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ZoomifyOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `cacheSize=`*(options: ZoomifyOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(options: ZoomifyOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: ZoomifyOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: ZoomifyOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: ZoomifyOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `interpolate=`*(options: ZoomifyOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `projection=`*(options: ZoomifyOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: ZoomifyOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `tilePixelRatio=`*(options: ZoomifyOptions, value: float) {.importjs: "#.tilePixelRatio = #".}
proc `reprojectionErrorThreshold=`*(options: ZoomifyOptions, value: float) {.importjs: "#.reprojectionErrorThreshold = #".}
proc `url=`*(options: ZoomifyOptions, value: cstring) {.importjs: "#.url = #".}
proc `tierSizeCalculation=`*(options: ZoomifyOptions, value: JsObject) {.importjs: "#.tierSizeCalculation = #".}
proc `tierSizeCalculation=`*(options: ZoomifyOptions, value: RootRef) {.importjs: "#.tierSizeCalculation = #".}
proc `size=`*(options: ZoomifyOptions, value: JsObject) {.importjs: "#.size = #".}
proc `size=`*(options: ZoomifyOptions, value: RootRef) {.importjs: "#.size = #".}
proc `extent=`*(options: ZoomifyOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: ZoomifyOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `transition=`*(options: ZoomifyOptions, value: float) {.importjs: "#.transition = #".}
proc `tileSize=`*(options: ZoomifyOptions, value: float) {.importjs: "#.tileSize = #".}
proc `zDirection=`*(options: ZoomifyOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: ZoomifyOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: ZoomifyOptions, value: RootRef) {.importjs: "#.zDirection = #".}

proc newZoomify*(options: ZoomifyOptions): Zoomify {.importjs: "(new olNs_source_Zoomify.default(#))".}
