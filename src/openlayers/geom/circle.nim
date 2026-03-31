import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_Circle from 'ol/geom/Circle.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_Circle)".}

type
  OlCircle* = ref object of JsRoot
proc newOlCircle*(center: JsObject, radius: JsObject = jsUndefined, layout: JsObject = jsUndefined): OlCircle {.importjs: "(new olNs_geom_Circle.default(#, #, #))".}
proc getCenter*(self: OlCircle): JsObject {.importjs: "#.getCenter()".}
proc getRadius*(self: OlCircle): float {.importjs: "#.getRadius()".}
proc setCenter*(self: OlCircle, center: JsObject) {.importjs: "#.setCenter(#)".}
proc setCenterAndRadius*(self: OlCircle, center: JsObject, radius: float, layout: JsObject = jsUndefined) {.importjs: "#.setCenterAndRadius(#, #, #)".}
proc setRadius*(self: OlCircle, radius: float) {.importjs: "#.setRadius(#)".}
