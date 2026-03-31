import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_IconImage from 'ol/style/IconImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_IconImage)".}

type
  OlIconImage* = ref object of JsRoot
proc newOlIconImage*(image: JsObject, src: cstring, imageAttributes: JsObject, imageState: JsObject, color: JsObject): OlIconImage {.importjs: "(new olNs_style_IconImage.default(#, #, #, #, #))".}
proc getImage*(self: OlIconImage, pixelRatio: float): JsObject {.importjs: "#.getImage(#)".}
proc setImage*(self: OlIconImage, image: JsObject) {.importjs: "#.setImage(#)".}
proc getPixelRatio*(self: OlIconImage, pixelRatio: float): float {.importjs: "#.getPixelRatio(#)".}
proc getImageState*(self: OlIconImage): JsObject {.importjs: "#.getImageState()".}
proc getHitDetectionImage*(self: OlIconImage): JsObject {.importjs: "#.getHitDetectionImage()".}
proc getSize*(self: OlIconImage): JsObject {.importjs: "#.getSize()".}
proc getSrc*(self: OlIconImage): cstring {.importjs: "#.getSrc()".}
proc load*(self: OlIconImage) {.importjs: "#.load()".}
proc ready*(self: OlIconImage): JsObject {.importjs: "#.ready()".}

proc get*(image: JsObject, src: cstring, imageAttributes: JsObject, imageState: JsObject, color: JsObject, pattern: JsObject = jsUndefined): JsObject {.importjs: "olNs_style_IconImage.get(#, #, #, #, #, #)".}
