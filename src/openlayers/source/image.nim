import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_Image from 'ol/source/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Image)".}

type
  ImageSource* = ref object of JsRoot
proc newImageSource*(options: JsObject): ImageSource {.importjs: "(new olNs_source_Image.default(#))".}
proc setResolutions*(self: ImageSource, resolutions: JsObject) {.importjs: "#.setResolutions(#)".}
proc findNearestResolution*(self: ImageSource, resolution: float): float {.importjs: "#.findNearestResolution(#)".}
proc getImage*(self: ImageSource, extent: JsObject, resolution: float, pixelRatio: float, projection: JsObject): JsObject {.importjs: "#.getImage(#, #, #, #)".}
proc getImageInternal*(self: ImageSource, extent: JsObject, resolution: float, pixelRatio: float, projection: JsObject): JsObject {.importjs: "#.getImageInternal(#, #, #, #)".}
proc handleImageChange*(self: ImageSource, event: JsObject) {.importjs: "#.handleImageChange(#)".}

proc defaultImageLoadFunction*(image: JsObject, src: cstring) {.importjs: "olNs_source_Image.defaultImageLoadFunction(#, #)".}
proc getRequestExtent*(extent: JsObject, resolution: float, pixelRatio: float, ratio: float): JsObject {.importjs: "olNs_source_Image.getRequestExtent(#, #, #, #)".}

type
  ImageSourceOptions* = ref object of JsRoot

proc newImageSourceOptions*(): ImageSourceOptions {.importjs: "({})".}
proc `attributions=`*(options: ImageSourceOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageSourceOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageSourceOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ImageSourceOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `interpolate=`*(options: ImageSourceOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `loader=`*(options: ImageSourceOptions, value: JsObject) {.importjs: "#.loader = #".}
proc `loader=`*(options: ImageSourceOptions, value: RootRef) {.importjs: "#.loader = #".}
proc `projection=`*(options: ImageSourceOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: ImageSourceOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `resolutions=`*(options: ImageSourceOptions, value: seq[float]) {.importjs: "#.resolutions = #".}
proc `state=`*(options: ImageSourceOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: ImageSourceOptions, value: RootRef) {.importjs: "#.state = #".}

proc newImageSource*(options: ImageSourceOptions): ImageSource {.importjs: "(new olNs_source_Image.default(#))".}
