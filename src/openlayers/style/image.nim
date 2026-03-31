import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Image from 'ol/style/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Image)".}

type ImageStyle* = ref object of JsRoot
proc newImageStyle*(
  options: JsObject
): ImageStyle {.importjs: "(new olNs_style_Image.default(#))".}

proc clone*(self: ImageStyle): JsObject {.importjs: "#.clone()".}
proc getOpacity*(self: ImageStyle): float {.importjs: "#.getOpacity()".}
proc getRotateWithView*(self: ImageStyle): bool {.importjs: "#.getRotateWithView()".}
proc getRotation*(self: ImageStyle): float {.importjs: "#.getRotation()".}
proc getScale*(self: ImageStyle): JsObject {.importjs: "#.getScale()".}
proc getScaleArray*(self: ImageStyle): JsObject {.importjs: "#.getScaleArray()".}
proc getDisplacement*(self: ImageStyle): seq[float] {.importjs: "#.getDisplacement()".}
proc getDeclutterMode*(self: ImageStyle): JsObject {.importjs: "#.getDeclutterMode()".}
proc getAnchor*(self: ImageStyle): seq[float] {.importjs: "#.getAnchor()".}
proc getImage*(
  self: ImageStyle, pixelRatio: float
): JsObject {.importjs: "#.getImage(#)".}

proc getHitDetectionImage*(
  self: ImageStyle
): JsObject {.importjs: "#.getHitDetectionImage()".}

proc getPixelRatio*(
  self: ImageStyle, pixelRatio: float
): float {.importjs: "#.getPixelRatio(#)".}

proc getImageState*(self: ImageStyle): JsObject {.importjs: "#.getImageState()".}
proc getImageSize*(self: ImageStyle): JsObject {.importjs: "#.getImageSize()".}
proc getOrigin*(self: ImageStyle): seq[float] {.importjs: "#.getOrigin()".}
proc getSize*(self: ImageStyle): JsObject {.importjs: "#.getSize()".}
proc setDisplacement*(
  self: ImageStyle, displacement: seq[float]
) {.importjs: "#.setDisplacement(#)".}

proc setOpacity*(self: ImageStyle, opacity: float) {.importjs: "#.setOpacity(#)".}
proc setRotateWithView*(
  self: ImageStyle, rotateWithView: bool
) {.importjs: "#.setRotateWithView(#)".}

proc setRotation*(self: ImageStyle, rotation: float) {.importjs: "#.setRotation(#)".}
proc setScale*(self: ImageStyle, scale: JsObject) {.importjs: "#.setScale(#)".}
proc listenImageChange*(
  self: ImageStyle, listener: JsObject
) {.importjs: "#.listenImageChange(#)".}

proc load*(self: ImageStyle) {.importjs: "#.load()".}
proc unlistenImageChange*(
  self: ImageStyle, listener: JsObject
) {.importjs: "#.unlistenImageChange(#)".}

proc ready*(self: ImageStyle): JsObject {.importjs: "#.ready()".}

type ImageStyleOptions* = ref object of JsRoot

proc newImageStyleOptions*(): ImageStyleOptions {.importjs: "({})".}
proc `opacity=`*(options: ImageStyleOptions, value: float) {.importjs: "#.opacity = #".}
proc `rotateWithView=`*(
  options: ImageStyleOptions, value: bool
) {.importjs: "#.rotateWithView = #".}

proc `rotation=`*(
  options: ImageStyleOptions, value: float
) {.importjs: "#.rotation = #".}

proc `scale=`*(options: ImageStyleOptions, value: float) {.importjs: "#.scale = #".}
proc `scale=`*(options: ImageStyleOptions, value: JsObject) {.importjs: "#.scale = #".}
proc `scale=`*(options: ImageStyleOptions, value: RootRef) {.importjs: "#.scale = #".}
proc `displacement=`*(
  options: ImageStyleOptions, value: seq[float]
) {.importjs: "#.displacement = #".}

proc `declutterMode=`*(
  options: ImageStyleOptions, value: JsObject
) {.importjs: "#.declutterMode = #".}

proc `declutterMode=`*(
  options: ImageStyleOptions, value: RootRef
) {.importjs: "#.declutterMode = #".}

proc newImageStyle*(
  options: ImageStyleOptions
): ImageStyle {.importjs: "(new olNs_style_Image.default(#))".}
