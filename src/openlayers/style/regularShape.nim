import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_RegularShape from 'ol/style/RegularShape.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_RegularShape)".}

type
  OlRegularShape* = ref object of JsRoot
proc newOlRegularShape*(options: JsObject): OlRegularShape {.importjs: "(new olNs_style_RegularShape.default(#))".}
proc getAngle*(self: OlRegularShape): float {.importjs: "#.getAngle()".}
proc getFill*(self: OlRegularShape): JsObject {.importjs: "#.getFill()".}
proc setFill*(self: OlRegularShape, fill: JsObject) {.importjs: "#.setFill(#)".}
proc getPoints*(self: OlRegularShape): float {.importjs: "#.getPoints()".}
proc getRadius*(self: OlRegularShape): float {.importjs: "#.getRadius()".}
proc setRadius*(self: OlRegularShape, radius: float) {.importjs: "#.setRadius(#)".}
proc getRadius2*(self: OlRegularShape): float {.importjs: "#.getRadius2()".}
proc setRadius2*(self: OlRegularShape, radius2: float) {.importjs: "#.setRadius2(#)".}
proc getStroke*(self: OlRegularShape): JsObject {.importjs: "#.getStroke()".}
proc setStroke*(self: OlRegularShape, stroke: JsObject) {.importjs: "#.setStroke(#)".}
proc createRenderOptions*(self: OlRegularShape): JsObject {.importjs: "#.createRenderOptions()".}
proc render*(self: OlRegularShape) {.importjs: "#.render()".}
