import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
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
