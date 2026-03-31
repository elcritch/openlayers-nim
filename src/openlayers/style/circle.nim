import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Circle from 'ol/style/Circle.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Circle)".}

type
  CircleStyle* = ref object of JsRoot
proc newCircleStyle*(options: JsObject = jsUndefined): CircleStyle {.importjs: "(new olNs_style_Circle.default(#))".}

type
  CircleStyleOptions* = ref object of JsRoot

proc newCircleStyleOptions*(): CircleStyleOptions {.importjs: "({})".}
proc `fill=`*(options: CircleStyleOptions, value: JsObject) {.importjs: "#.fill = #".}
proc `fill=`*(options: CircleStyleOptions, value: RootRef) {.importjs: "#.fill = #".}
proc `radius=`*(options: CircleStyleOptions, value: float) {.importjs: "#.radius = #".}
proc `stroke=`*(options: CircleStyleOptions, value: JsObject) {.importjs: "#.stroke = #".}
proc `stroke=`*(options: CircleStyleOptions, value: RootRef) {.importjs: "#.stroke = #".}
proc `displacement=`*(options: CircleStyleOptions, value: seq[float]) {.importjs: "#.displacement = #".}
proc `scale=`*(options: CircleStyleOptions, value: float) {.importjs: "#.scale = #".}
proc `scale=`*(options: CircleStyleOptions, value: JsObject) {.importjs: "#.scale = #".}
proc `scale=`*(options: CircleStyleOptions, value: RootRef) {.importjs: "#.scale = #".}
proc `rotation=`*(options: CircleStyleOptions, value: float) {.importjs: "#.rotation = #".}
proc `rotateWithView=`*(options: CircleStyleOptions, value: bool) {.importjs: "#.rotateWithView = #".}
proc `declutterMode=`*(options: CircleStyleOptions, value: JsObject) {.importjs: "#.declutterMode = #".}
proc `declutterMode=`*(options: CircleStyleOptions, value: RootRef) {.importjs: "#.declutterMode = #".}

proc newCircleStyle*(options: CircleStyleOptions): CircleStyle {.importjs: "(new olNs_style_Circle.default(#))".}
