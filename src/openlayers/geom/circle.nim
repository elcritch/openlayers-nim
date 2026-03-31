import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_Circle from 'ol/geom/Circle.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_Circle)".}

type
  Circle* = ref object of JsRoot
proc newCircle*(center: JsObject, radius: JsObject = jsUndefined, layout: JsObject = jsUndefined): Circle {.importjs: "(new olNs_geom_Circle.default(#, #, #))".}
proc getCenter*(self: Circle): JsObject {.importjs: "#.getCenter()".}
proc getRadius*(self: Circle): float {.importjs: "#.getRadius()".}
proc setCenter*(self: Circle, center: JsObject) {.importjs: "#.setCenter(#)".}
proc setCenterAndRadius*(self: Circle, center: JsObject, radius: float, layout: JsObject = jsUndefined) {.importjs: "#.setCenterAndRadius(#, #, #)".}
proc setRadius*(self: Circle, radius: float) {.importjs: "#.setRadius(#)".}
