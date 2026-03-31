import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Image from 'ol/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Image)".}

type
  OlImageWrapper* = ref object of JsRoot
proc newOlImageWrapper*(extent: JsObject, resolution: JsObject, pixelRatio: float, stateOrLoader: JsObject): OlImageWrapper {.importjs: "(new olNs_Image.default(#, #, #, #))".}
proc changed*(self: OlImageWrapper) {.importjs: "#.changed()".}
proc getExtent*(self: OlImageWrapper): JsObject {.importjs: "#.getExtent()".}
proc getImage*(self: OlImageWrapper): JsObject {.importjs: "#.getImage()".}
proc getPixelRatio*(self: OlImageWrapper): float {.importjs: "#.getPixelRatio()".}
proc getResolution*(self: OlImageWrapper): JsObject {.importjs: "#.getResolution()".}
proc getState*(self: OlImageWrapper): JsObject {.importjs: "#.getState()".}
proc load*(self: OlImageWrapper) {.importjs: "#.load()".}
proc setImage*(self: OlImageWrapper, image: JsObject) {.importjs: "#.setImage(#)".}
proc setResolution*(self: OlImageWrapper, resolution: JsObject) {.importjs: "#.setResolution(#)".}

proc listenImage*(image: JsObject, loadHandler: JsObject, errorHandler: JsObject): JsObject {.importjs: "olNs_Image.listenImage(#, #, #)".}
proc load2*(image: JsObject, src: JsObject = jsUndefined): JsObject {.importjs: "olNs_Image.load(#, #)".}
proc decodeFallback*(image: JsObject, src: JsObject = jsUndefined): JsObject {.importjs: "olNs_Image.decodeFallback(#, #)".}
proc decode*(image: JsObject, src: JsObject = jsUndefined): JsObject {.importjs: "olNs_Image.decode(#, #)".}
