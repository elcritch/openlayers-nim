import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Image from 'ol/style/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Image)".}

type
  OlImageStyle* = ref object of JsRoot
proc newOlImageStyle*(options: JsObject): OlImageStyle {.importjs: "(new olNs_style_Image.default(#))".}
proc clone*(self: OlImageStyle): JsObject {.importjs: "#.clone()".}
proc getOpacity*(self: OlImageStyle): float {.importjs: "#.getOpacity()".}
proc getRotateWithView*(self: OlImageStyle): bool {.importjs: "#.getRotateWithView()".}
proc getRotation*(self: OlImageStyle): float {.importjs: "#.getRotation()".}
proc getScale*(self: OlImageStyle): JsObject {.importjs: "#.getScale()".}
proc getScaleArray*(self: OlImageStyle): JsObject {.importjs: "#.getScaleArray()".}
proc getDisplacement*(self: OlImageStyle): seq[float] {.importjs: "#.getDisplacement()".}
proc getDeclutterMode*(self: OlImageStyle): JsObject {.importjs: "#.getDeclutterMode()".}
proc getAnchor*(self: OlImageStyle): seq[float] {.importjs: "#.getAnchor()".}
proc getImage*(self: OlImageStyle, pixelRatio: float): JsObject {.importjs: "#.getImage(#)".}
proc getHitDetectionImage*(self: OlImageStyle): JsObject {.importjs: "#.getHitDetectionImage()".}
proc getPixelRatio*(self: OlImageStyle, pixelRatio: float): float {.importjs: "#.getPixelRatio(#)".}
proc getImageState*(self: OlImageStyle): JsObject {.importjs: "#.getImageState()".}
proc getImageSize*(self: OlImageStyle): JsObject {.importjs: "#.getImageSize()".}
proc getOrigin*(self: OlImageStyle): seq[float] {.importjs: "#.getOrigin()".}
proc getSize*(self: OlImageStyle): JsObject {.importjs: "#.getSize()".}
proc setDisplacement*(self: OlImageStyle, displacement: seq[float]) {.importjs: "#.setDisplacement(#)".}
proc setOpacity*(self: OlImageStyle, opacity: float) {.importjs: "#.setOpacity(#)".}
proc setRotateWithView*(self: OlImageStyle, rotateWithView: bool) {.importjs: "#.setRotateWithView(#)".}
proc setRotation*(self: OlImageStyle, rotation: float) {.importjs: "#.setRotation(#)".}
proc setScale*(self: OlImageStyle, scale: JsObject) {.importjs: "#.setScale(#)".}
proc listenImageChange*(self: OlImageStyle, listener: JsObject) {.importjs: "#.listenImageChange(#)".}
proc load*(self: OlImageStyle) {.importjs: "#.load()".}
proc unlistenImageChange*(self: OlImageStyle, listener: JsObject) {.importjs: "#.unlistenImageChange(#)".}
proc ready*(self: OlImageStyle): JsObject {.importjs: "#.ready()".}
