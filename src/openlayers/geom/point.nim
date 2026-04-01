import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_geom_Point from 'ol/geom/Point.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_Point)".}

type Point* = ref object of JsRoot
proc newPoint*(
  coordinates: JsObject, layout: JsObject = jsUndefined
): Point {.importjs: "(new olNs_geom_Point.default(#, #))".}

proc getCoordinates*(self: Point): JsObject {.importjs: "#.getCoordinates()".}
proc setCoordinates*(
  self: Point, coordinates: JsObject, layout: JsObject = jsUndefined
) {.importjs: "#.setCoordinates(#, #)".}
