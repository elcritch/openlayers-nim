import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_RegularShape from 'ol/style/RegularShape.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_RegularShape)".}

type
  RegularShape* = ref object of JsRoot
proc newRegularShape*(options: JsObject): RegularShape {.importjs: "(new olNs_style_RegularShape.default(#))".}
proc getAngle*(self: RegularShape): float {.importjs: "#.getAngle()".}
proc getFill*(self: RegularShape): JsObject {.importjs: "#.getFill()".}
proc setFill*(self: RegularShape, fill: JsObject) {.importjs: "#.setFill(#)".}
proc getPoints*(self: RegularShape): float {.importjs: "#.getPoints()".}
proc getRadius*(self: RegularShape): float {.importjs: "#.getRadius()".}
proc setRadius*(self: RegularShape, radius: float) {.importjs: "#.setRadius(#)".}
proc getRadius2*(self: RegularShape): float {.importjs: "#.getRadius2()".}
proc setRadius2*(self: RegularShape, radius2: float) {.importjs: "#.setRadius2(#)".}
proc getStroke*(self: RegularShape): JsObject {.importjs: "#.getStroke()".}
proc setStroke*(self: RegularShape, stroke: JsObject) {.importjs: "#.setStroke(#)".}
proc createRenderOptions*(self: RegularShape): JsObject {.importjs: "#.createRenderOptions()".}
proc render*(self: RegularShape) {.importjs: "#.render()".}
