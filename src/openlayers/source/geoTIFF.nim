import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_GeoTIFF from 'ol/source/GeoTIFF.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_GeoTIFF)".}

type
  GeoTIFFSource* = ref object of JsRoot
proc newGeoTIFFSource*(options: JsObject): GeoTIFFSource {.importjs: "(new olNs_source_GeoTIFF.default(#))".}
proc getError*(self: GeoTIFFSource): JsObject {.importjs: "#.getError()".}
proc determineProjection*(self: GeoTIFFSource, sources: JsObject) {.importjs: "#.determineProjection(#)".}
proc determineTransformMatrix*(self: GeoTIFFSource, sources: JsObject) {.importjs: "#.determineTransformMatrix(#)".}

type
  GeoTIFFSourceOptions* = ref object of JsRoot

proc newGeoTIFFSourceOptions*(): GeoTIFFSourceOptions {.importjs: "({})".}
proc `forceXHR=`*(options: GeoTIFFSourceOptions, value: bool) {.importjs: "#.forceXHR = #".}
proc `headers=`*(options: GeoTIFFSourceOptions, value: JsObject) {.importjs: "#.headers = #".}
proc `headers=`*(options: GeoTIFFSourceOptions, value: RootRef) {.importjs: "#.headers = #".}
proc `credentials=`*(options: GeoTIFFSourceOptions, value: cstring) {.importjs: "#.credentials = #".}
proc `maxRanges=`*(options: GeoTIFFSourceOptions, value: float) {.importjs: "#.maxRanges = #".}
proc `allowFullFile=`*(options: GeoTIFFSourceOptions, value: bool) {.importjs: "#.allowFullFile = #".}
proc `blockSize=`*(options: GeoTIFFSourceOptions, value: float) {.importjs: "#.blockSize = #".}
proc `cacheSize=`*(options: GeoTIFFSourceOptions, value: float) {.importjs: "#.cacheSize = #".}

proc newGeoTIFFSource*(options: GeoTIFFSourceOptions): GeoTIFFSource {.importjs: "(new olNs_source_GeoTIFF.default(#))".}

type
  GeoTIFFSourceOptions* = ref object of JsRoot

proc newGeoTIFFSourceOptions*(): GeoTIFFSourceOptions {.importjs: "({})".}
proc `attributions=`*(options: GeoTIFFSourceOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: GeoTIFFSourceOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: GeoTIFFSourceOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: GeoTIFFSourceOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `sources=`*(options: GeoTIFFSourceOptions, value: JsObject) {.importjs: "#.sources = #".}
proc `sources=`*(options: GeoTIFFSourceOptions, value: RootRef) {.importjs: "#.sources = #".}
proc `sources=`*[T](options: GeoTIFFSourceOptions, value: seq[T]) {.importjs: "#.sources = #".}
proc `sourceOptions=`*(options: GeoTIFFSourceOptions, value: JsObject) {.importjs: "#.sourceOptions = #".}
proc `sourceOptions=`*(options: GeoTIFFSourceOptions, value: RootRef) {.importjs: "#.sourceOptions = #".}
proc `convertToRGB=`*(options: GeoTIFFSourceOptions, value: bool) {.importjs: "#.convertToRGB = #".}
proc `convertToRGB=`*(options: GeoTIFFSourceOptions, value: cstring) {.importjs: "#.convertToRGB = #".}
proc `normalize=`*(options: GeoTIFFSourceOptions, value: bool) {.importjs: "#.normalize = #".}
proc `projection=`*(options: GeoTIFFSourceOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: GeoTIFFSourceOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `transition=`*(options: GeoTIFFSourceOptions, value: float) {.importjs: "#.transition = #".}
proc `wrapX=`*(options: GeoTIFFSourceOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `interpolate=`*(options: GeoTIFFSourceOptions, value: bool) {.importjs: "#.interpolate = #".}

proc newGeoTIFFSource*(options: GeoTIFFSourceOptions): GeoTIFFSource {.importjs: "(new olNs_source_GeoTIFF.default(#))".}
