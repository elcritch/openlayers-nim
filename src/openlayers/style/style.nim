import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Style from 'ol/style/Style.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Style)".}

type
  OlStyleOptions* = ref object of JsRoot
  OlStyle* = ref object of JsRoot

proc newOlStyleOptions*(): OlStyleOptions {.importjs: "({})".}
proc `geometry=`*(
  options: OlStyleOptions, value: cstring
) {.importjs: "#.geometry = #".}

proc `geometry=`*(
  options: OlStyleOptions, value: JsObject
) {.importjs: "#.geometry = #".}

proc `fill=`*(options: OlStyleOptions, value: JsObject) {.importjs: "#.fill = #".}
proc `fill=`*(options: OlStyleOptions, value: RootRef) {.importjs: "#.fill = #".}
proc `image=`*(options: OlStyleOptions, value: JsObject) {.importjs: "#.image = #".}
proc `renderer=`*(
  options: OlStyleOptions, value: JsObject
) {.importjs: "#.renderer = #".}

proc `hitDetectionRenderer=`*(
  options: OlStyleOptions, value: JsObject
) {.importjs: "#.hitDetectionRenderer = #".}

proc `stroke=`*(options: OlStyleOptions, value: JsObject) {.importjs: "#.stroke = #".}
proc `stroke=`*(options: OlStyleOptions, value: RootRef) {.importjs: "#.stroke = #".}
proc `text=`*(options: OlStyleOptions, value: JsObject) {.importjs: "#.text = #".}
proc `zIndex=`*(options: OlStyleOptions, value: float) {.importjs: "#.zIndex = #".}

proc newOlStyle*(
  options: JsObject = jsUndefined
): OlStyle {.importjs: "(new olNs_style_Style.default(#))".}

proc newOlStyle*(
  options: OlStyleOptions
): OlStyle {.importjs: "(new olNs_style_Style.default(#))".}

proc clone*(self: OlStyle): JsObject {.importjs: "#.clone()".}
proc getRenderer*(self: OlStyle): JsObject {.importjs: "#.getRenderer()".}
proc setRenderer*(self: OlStyle, renderer: JsObject) {.importjs: "#.setRenderer(#)".}
proc setHitDetectionRenderer*(
  self: OlStyle, renderer: JsObject
) {.importjs: "#.setHitDetectionRenderer(#)".}

proc getHitDetectionRenderer*(
  self: OlStyle
): JsObject {.importjs: "#.getHitDetectionRenderer()".}

proc getGeometry*(self: OlStyle): JsObject {.importjs: "#.getGeometry()".}
proc getGeometryFunction*(
  self: OlStyle
): JsObject {.importjs: "#.getGeometryFunction()".}

proc getFill*(self: OlStyle): JsObject {.importjs: "#.getFill()".}
proc setFill*(self: OlStyle, fill: JsObject) {.importjs: "#.setFill(#)".}
proc getImage*(self: OlStyle): JsObject {.importjs: "#.getImage()".}
proc setImage*(self: OlStyle, image: JsObject) {.importjs: "#.setImage(#)".}
proc getStroke*(self: OlStyle): JsObject {.importjs: "#.getStroke()".}
proc setStroke*(self: OlStyle, stroke: JsObject) {.importjs: "#.setStroke(#)".}
proc getText*(self: OlStyle): JsObject {.importjs: "#.getText()".}
proc setText*(self: OlStyle, text: JsObject) {.importjs: "#.setText(#)".}
proc getZIndex*(self: OlStyle): float {.importjs: "#.getZIndex()".}
proc setGeometry*(self: OlStyle, geometry: JsObject) {.importjs: "#.setGeometry(#)".}
proc setZIndex*(self: OlStyle, zIndex: float) {.importjs: "#.setZIndex(#)".}

proc toFunction*(obj: JsObject): JsObject {.importjs: "olNs_style_Style.toFunction(#)".}
proc createDefaultStyle*(
  feature: JsObject, resolution: float
): JsObject {.importjs: "olNs_style_Style.createDefaultStyle(#, #)".}

proc createEditingStyle*(): JsObject {.
  importjs: "olNs_style_Style.createEditingStyle()"
.}
