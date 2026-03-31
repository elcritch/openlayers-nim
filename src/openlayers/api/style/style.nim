import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Style from 'ol/style/Style.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Style)".}

type
  OlStyle* = ref object of JsRoot
proc newOlStyle*(options: JsObject = jsUndefined): OlStyle {.importjs: "(new olNs_style_Style.default(#))".}
proc clone*(self: OlStyle): JsObject {.importjs: "#.clone()".}
proc getRenderer*(self: OlStyle): JsObject {.importjs: "#.getRenderer()".}
proc setRenderer*(self: OlStyle, renderer: JsObject) {.importjs: "#.setRenderer(#)".}
proc setHitDetectionRenderer*(self: OlStyle, renderer: JsObject) {.importjs: "#.setHitDetectionRenderer(#)".}
proc getHitDetectionRenderer*(self: OlStyle): JsObject {.importjs: "#.getHitDetectionRenderer()".}
proc getGeometry*(self: OlStyle): JsObject {.importjs: "#.getGeometry()".}
proc getGeometryFunction*(self: OlStyle): JsObject {.importjs: "#.getGeometryFunction()".}
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
proc createDefaultStyle*(feature: JsObject, resolution: float): JsObject {.importjs: "olNs_style_Style.createDefaultStyle(#, #)".}
proc createEditingStyle*(): JsObject {.importjs: "olNs_style_Style.createEditingStyle()".}
