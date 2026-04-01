import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_style_Icon from 'ol/style/Icon.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Icon)".}

type
  Icon* = ref object of JsRoot
proc newIcon*(options: JsObject = jsUndefined): Icon {.importjs: "(new olNs_style_Icon.default(#))".}
proc setAnchor*(self: Icon, anchor: seq[float]) {.importjs: "#.setAnchor(#)".}
proc getColor*(self: Icon): JsObject {.importjs: "#.getColor()".}
proc setColor*(self: Icon, color: JsObject) {.importjs: "#.setColor(#)".}
proc getSrc*(self: Icon): cstring {.importjs: "#.getSrc()".}
proc setSrc*(self: Icon, src: cstring) {.importjs: "#.setSrc(#)".}
proc getWidth*(self: Icon): float {.importjs: "#.getWidth()".}
proc getHeight*(self: Icon): float {.importjs: "#.getHeight()".}

type
  IconOptions* = ref object of JsRoot

proc newIconOptions*(): IconOptions {.importjs: "({})".}
proc `anchor=`*(options: IconOptions, value: seq[float]) {.importjs: "#.anchor = #".}
proc `anchorOrigin=`*(options: IconOptions, value: JsObject) {.importjs: "#.anchorOrigin = #".}
proc `anchorOrigin=`*(options: IconOptions, value: RootRef) {.importjs: "#.anchorOrigin = #".}
proc `anchorXUnits=`*(options: IconOptions, value: JsObject) {.importjs: "#.anchorXUnits = #".}
proc `anchorXUnits=`*(options: IconOptions, value: RootRef) {.importjs: "#.anchorXUnits = #".}
proc `anchorYUnits=`*(options: IconOptions, value: JsObject) {.importjs: "#.anchorYUnits = #".}
proc `anchorYUnits=`*(options: IconOptions, value: RootRef) {.importjs: "#.anchorYUnits = #".}
proc `color=`*(options: IconOptions, value: cstring) {.importjs: "#.color = #".}
proc `color=`*(options: IconOptions, value: JsObject) {.importjs: "#.color = #".}
proc `color=`*(options: IconOptions, value: RootRef) {.importjs: "#.color = #".}
proc `crossOrigin=`*(options: IconOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: IconOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: IconOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: IconOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `img=`*(options: IconOptions, value: JsObject) {.importjs: "#.img = #".}
proc `img=`*(options: IconOptions, value: RootRef) {.importjs: "#.img = #".}
proc `displacement=`*(options: IconOptions, value: seq[float]) {.importjs: "#.displacement = #".}
proc `opacity=`*(options: IconOptions, value: float) {.importjs: "#.opacity = #".}
proc `width=`*(options: IconOptions, value: float) {.importjs: "#.width = #".}
proc `height=`*(options: IconOptions, value: float) {.importjs: "#.height = #".}
proc `scale=`*(options: IconOptions, value: float) {.importjs: "#.scale = #".}
proc `scale=`*(options: IconOptions, value: JsObject) {.importjs: "#.scale = #".}
proc `scale=`*(options: IconOptions, value: RootRef) {.importjs: "#.scale = #".}
proc `rotateWithView=`*(options: IconOptions, value: bool) {.importjs: "#.rotateWithView = #".}
proc `rotation=`*(options: IconOptions, value: float) {.importjs: "#.rotation = #".}
proc `offset=`*(options: IconOptions, value: seq[float]) {.importjs: "#.offset = #".}
proc `offsetOrigin=`*(options: IconOptions, value: JsObject) {.importjs: "#.offsetOrigin = #".}
proc `offsetOrigin=`*(options: IconOptions, value: RootRef) {.importjs: "#.offsetOrigin = #".}
proc `size=`*(options: IconOptions, value: JsObject) {.importjs: "#.size = #".}
proc `size=`*(options: IconOptions, value: RootRef) {.importjs: "#.size = #".}
proc `src=`*(options: IconOptions, value: cstring) {.importjs: "#.src = #".}
proc `declutterMode=`*(options: IconOptions, value: JsObject) {.importjs: "#.declutterMode = #".}
proc `declutterMode=`*(options: IconOptions, value: RootRef) {.importjs: "#.declutterMode = #".}

proc newIcon*(options: IconOptions): Icon {.importjs: "(new olNs_style_Icon.default(#))".}
