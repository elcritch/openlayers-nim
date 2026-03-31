import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_MultiPolygon from 'ol/geom/MultiPolygon.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_MultiPolygon)".}

type
  OlMultiPolygon* = ref object of JsRoot
proc newOlMultiPolygon*(coordinates: JsObject, layout: JsObject = jsUndefined, endss: JsObject = jsUndefined): OlMultiPolygon {.importjs: "(new olNs_geom_MultiPolygon.default(#, #, #))".}
proc appendPolygon*(self: OlMultiPolygon, polygon: JsObject) {.importjs: "#.appendPolygon(#)".}
proc getArea*(self: OlMultiPolygon): float {.importjs: "#.getArea()".}
proc getEndss*(self: OlMultiPolygon): JsObject {.importjs: "#.getEndss()".}
proc getFlatInteriorPoints*(self: OlMultiPolygon): seq[float] {.importjs: "#.getFlatInteriorPoints()".}
proc getInteriorPoints*(self: OlMultiPolygon): JsObject {.importjs: "#.getInteriorPoints()".}
proc getOrientedFlatCoordinates*(self: OlMultiPolygon): seq[float] {.importjs: "#.getOrientedFlatCoordinates()".}
proc getPolygon*(self: OlMultiPolygon, index: float): JsObject {.importjs: "#.getPolygon(#)".}
proc getPolygons*(self: OlMultiPolygon): JsObject {.importjs: "#.getPolygons()".}
