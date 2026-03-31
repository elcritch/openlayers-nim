import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Image from 'ol/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Image)".}

type ImageWrapper* = ref object of JsRoot
proc newImageWrapper*(
  extent: JsObject, resolution: JsObject, pixelRatio: float, stateOrLoader: JsObject
): ImageWrapper {.importjs: "(new olNs_Image.default(#, #, #, #))".}

proc changed*(self: ImageWrapper) {.importjs: "#.changed()".}
proc getExtent*(self: ImageWrapper): JsObject {.importjs: "#.getExtent()".}
proc getImage*(self: ImageWrapper): JsObject {.importjs: "#.getImage()".}
proc getPixelRatio*(self: ImageWrapper): float {.importjs: "#.getPixelRatio()".}
proc getResolution*(self: ImageWrapper): JsObject {.importjs: "#.getResolution()".}
proc getState*(self: ImageWrapper): JsObject {.importjs: "#.getState()".}
proc load*(self: ImageWrapper) {.importjs: "#.load()".}
proc setImage*(self: ImageWrapper, image: JsObject) {.importjs: "#.setImage(#)".}
proc setResolution*(
  self: ImageWrapper, resolution: JsObject
) {.importjs: "#.setResolution(#)".}

proc listenImage*(
  image: JsObject, loadHandler: JsObject, errorHandler: JsObject
): JsObject {.importjs: "olNs_Image.listenImage(#, #, #)".}

proc load2*(
  image: JsObject, src: JsObject = jsUndefined
): JsObject {.importjs: "olNs_Image.load(#, #)".}

proc decodeFallback*(
  image: JsObject, src: JsObject = jsUndefined
): JsObject {.importjs: "olNs_Image.decodeFallback(#, #)".}

proc decode*(
  image: JsObject, src: JsObject = jsUndefined
): JsObject {.importjs: "olNs_Image.decode(#, #)".}
