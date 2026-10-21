import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(openlayers.globalBundle):
  {.
    emit: """
var olNs_source_Image = Object.assign(
  {default: globalThis.ol?.source?.Image}, globalThis.ol?.source?.Image);
"""
  .}
elif not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_Image from 'ol/source/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Image)".}

type ImageSource* = ref object of JsRoot
proc newImageSource*(
  options: JsObject
): ImageSource {.importjs: "(new olNs_source_Image.default(#))".}

proc setResolutions*(
  self: ImageSource, resolutions: JsObject
) {.importjs: "#.setResolutions(#)".}

proc findNearestResolution*(
  self: ImageSource, resolution: float
): float {.importjs: "#.findNearestResolution(#)".}

proc getImage*(
  self: ImageSource,
  extent: JsObject,
  resolution: float,
  pixelRatio: float,
  projection: JsObject,
): JsObject {.importjs: "#.getImage(#, #, #, #)".}

proc getImageInternal*(
  self: ImageSource,
  extent: JsObject,
  resolution: float,
  pixelRatio: float,
  projection: JsObject,
): JsObject {.importjs: "#.getImageInternal(#, #, #, #)".}

proc handleImageChange*(
  self: ImageSource, event: JsObject
) {.importjs: "#.handleImageChange(#)".}

proc defaultImageLoadFunction*(
  image: JsObject, src: cstring
) {.importjs: "olNs_source_Image.defaultImageLoadFunction(#, #)".}

proc getRequestExtent*(
  extent: JsObject, resolution: float, pixelRatio: float, ratio: float
): JsObject {.importjs: "olNs_source_Image.getRequestExtent(#, #, #, #)".}

type ImageSourceOptions* = ref object of JsRoot

type
  ImageObject* = ref object of JsRoot
    ## An existing bitmap with its actual extent, resolution and pixel ratio.

  StaticImageLoader* = proc(): ImageObject
    ## A zero-argument loader lets OpenLayers cache a bitmap across view changes.

proc newImageObject*(
  image: RootRef, extent, resolution: seq[float], pixelRatio = 1.0
): ImageObject {.importjs: "({image: #, extent: #, resolution: #, pixelRatio: #})".}

proc newImageSourceOptions*(): ImageSourceOptions {.importjs: "({})".}
proc `attributions=`*(
  options: ImageSourceOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: ImageSourceOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: ImageSourceOptions, value: cstring
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: ImageSourceOptions, value: seq[cstring]
) {.importjs: "#.attributions = #".}

proc `interpolate=`*(
  options: ImageSourceOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `loader=`*(
  options: ImageSourceOptions, value: JsObject
) {.importjs: "#.loader = #".}

proc `loader=`*(
  options: ImageSourceOptions, value: RootRef
) {.importjs: "#.loader = #".}

proc `loader=`*(
  options: ImageSourceOptions, value: StaticImageLoader
) {.importjs: "#.loader = #".}

proc `projection=`*(
  options: ImageSourceOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: ImageSourceOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: ImageSourceOptions, value: cstring
) {.importjs: "#.projection = #".}

proc `resolutions=`*(
  options: ImageSourceOptions, value: seq[float]
) {.importjs: "#.resolutions = #".}

proc `state=`*(options: ImageSourceOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: ImageSourceOptions, value: RootRef) {.importjs: "#.state = #".}

proc newImageSource*(
  options: ImageSourceOptions
): ImageSource {.importjs: "(new olNs_source_Image.default(#))".}
