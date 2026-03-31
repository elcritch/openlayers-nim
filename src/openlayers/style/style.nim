import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Style from 'ol/style/Style.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Style)".}

type
  Style* = ref object of JsRoot
proc newStyle*(options: JsObject = jsUndefined): Style {.importjs: "(new olNs_style_Style.default(#))".}
proc clone*(self: Style): JsObject {.importjs: "#.clone()".}
proc getRenderer*(self: Style): JsObject {.importjs: "#.getRenderer()".}
proc setRenderer*(self: Style, renderer: JsObject) {.importjs: "#.setRenderer(#)".}
proc setHitDetectionRenderer*(self: Style, renderer: JsObject) {.importjs: "#.setHitDetectionRenderer(#)".}
proc getHitDetectionRenderer*(self: Style): JsObject {.importjs: "#.getHitDetectionRenderer()".}
proc getGeometry*(self: Style): JsObject {.importjs: "#.getGeometry()".}
proc getGeometryFunction*(self: Style): JsObject {.importjs: "#.getGeometryFunction()".}
proc getFill*(self: Style): JsObject {.importjs: "#.getFill()".}
proc setFill*(self: Style, fill: JsObject) {.importjs: "#.setFill(#)".}
proc getImage*(self: Style): JsObject {.importjs: "#.getImage()".}
proc setImage*(self: Style, image: JsObject) {.importjs: "#.setImage(#)".}
proc getStroke*(self: Style): JsObject {.importjs: "#.getStroke()".}
proc setStroke*(self: Style, stroke: JsObject) {.importjs: "#.setStroke(#)".}
proc getText*(self: Style): JsObject {.importjs: "#.getText()".}
proc setText*(self: Style, text: JsObject) {.importjs: "#.setText(#)".}
proc getZIndex*(self: Style): float {.importjs: "#.getZIndex()".}
proc setGeometry*(self: Style, geometry: JsObject) {.importjs: "#.setGeometry(#)".}
proc setZIndex*(self: Style, zIndex: float) {.importjs: "#.setZIndex(#)".}

proc toFunction*(obj: JsObject): JsObject {.importjs: "olNs_style_Style.toFunction(#)".}
proc createDefaultStyle*(feature: JsObject, resolution: float): JsObject {.importjs: "olNs_style_Style.createDefaultStyle(#, #)".}
proc createEditingStyle*(): JsObject {.importjs: "olNs_style_Style.createEditingStyle()".}

type
  StyleOptions* = ref object of JsRoot

proc newStyleOptions*(): StyleOptions {.importjs: "({})".}
proc `geometry=`*(options: StyleOptions, value: cstring) {.importjs: "#.geometry = #".}
proc `geometry=`*(options: StyleOptions, value: JsObject) {.importjs: "#.geometry = #".}
proc `geometry=`*(options: StyleOptions, value: RootRef) {.importjs: "#.geometry = #".}
proc `fill=`*(options: StyleOptions, value: JsObject) {.importjs: "#.fill = #".}
proc `fill=`*(options: StyleOptions, value: RootRef) {.importjs: "#.fill = #".}
proc `image=`*(options: StyleOptions, value: JsObject) {.importjs: "#.image = #".}
proc `image=`*(options: StyleOptions, value: RootRef) {.importjs: "#.image = #".}
proc `renderer=`*(options: StyleOptions, value: JsObject) {.importjs: "#.renderer = #".}
proc `renderer=`*(options: StyleOptions, value: RootRef) {.importjs: "#.renderer = #".}
proc `hitDetectionRenderer=`*(options: StyleOptions, value: JsObject) {.importjs: "#.hitDetectionRenderer = #".}
proc `hitDetectionRenderer=`*(options: StyleOptions, value: RootRef) {.importjs: "#.hitDetectionRenderer = #".}
proc `stroke=`*(options: StyleOptions, value: JsObject) {.importjs: "#.stroke = #".}
proc `stroke=`*(options: StyleOptions, value: RootRef) {.importjs: "#.stroke = #".}
proc `text=`*(options: StyleOptions, value: JsObject) {.importjs: "#.text = #".}
proc `text=`*(options: StyleOptions, value: RootRef) {.importjs: "#.text = #".}
proc `zIndex=`*(options: StyleOptions, value: float) {.importjs: "#.zIndex = #".}

proc newStyle*(options: StyleOptions): Style {.importjs: "(new olNs_style_Style.default(#))".}
