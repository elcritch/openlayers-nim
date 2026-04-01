import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_Google from 'ol/source/Google.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Google)".}

type
  Google* = ref object of JsRoot
proc newGoogle*(options: JsObject): Google {.importjs: "(new olNs_source_Google.default(#))".}
proc getError*(self: Google): JsObject {.importjs: "#.getError()".}
proc fetchSessionToken*(self: Google, url: cstring, config: JsObject): JsObject {.importjs: "#.fetchSessionToken(#, #)".}

type
  GoogleOptions* = ref object of JsRoot

proc newGoogleOptions*(): GoogleOptions {.importjs: "({})".}
proc `key=`*(options: GoogleOptions, value: cstring) {.importjs: "#.key = #".}
proc `mapType=`*(options: GoogleOptions, value: cstring) {.importjs: "#.mapType = #".}
proc `language=`*(options: GoogleOptions, value: cstring) {.importjs: "#.language = #".}
proc `region=`*(options: GoogleOptions, value: cstring) {.importjs: "#.region = #".}
proc `imageFormat=`*(options: GoogleOptions, value: cstring) {.importjs: "#.imageFormat = #".}
proc `scale=`*(options: GoogleOptions, value: cstring) {.importjs: "#.scale = #".}
proc `highDpi=`*(options: GoogleOptions, value: bool) {.importjs: "#.highDpi = #".}
proc `layerTypes=`*(options: GoogleOptions, value: seq[cstring]) {.importjs: "#.layerTypes = #".}
proc `overlay=`*(options: GoogleOptions, value: bool) {.importjs: "#.overlay = #".}
proc `styles=`*(options: GoogleOptions, value: JsObject) {.importjs: "#.styles = #".}
proc `styles=`*(options: GoogleOptions, value: RootRef) {.importjs: "#.styles = #".}
proc `styles=`*[T](options: GoogleOptions, value: seq[T]) {.importjs: "#.styles = #".}
proc `attributionsCollapsible=`*(options: GoogleOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `interpolate=`*(options: GoogleOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `cacheSize=`*(options: GoogleOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `reprojectionErrorThreshold=`*(options: GoogleOptions, value: float) {.importjs: "#.reprojectionErrorThreshold = #".}
proc `tileLoadFunction=`*(options: GoogleOptions, value: JsObject) {.importjs: "#.tileLoadFunction = #".}
proc `tileLoadFunction=`*(options: GoogleOptions, value: RootRef) {.importjs: "#.tileLoadFunction = #".}
proc `apiOptions=`*(options: GoogleOptions, value: seq[cstring]) {.importjs: "#.apiOptions = #".}
proc `wrapX=`*(options: GoogleOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: GoogleOptions, value: float) {.importjs: "#.transition = #".}
proc `zDirection=`*(options: GoogleOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: GoogleOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: GoogleOptions, value: RootRef) {.importjs: "#.zDirection = #".}
proc `url=`*(options: GoogleOptions, value: cstring) {.importjs: "#.url = #".}

proc newGoogle*(options: GoogleOptions): Google {.importjs: "(new olNs_source_Google.default(#))".}
