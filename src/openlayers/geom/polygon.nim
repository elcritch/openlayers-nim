import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_Polygon from 'ol/geom/Polygon.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_Polygon)".}

type
  OlPolygon* = ref object of JsRoot
proc newOlPolygon*(coordinates: JsObject, layout: JsObject = jsUndefined, ends: JsObject = jsUndefined): OlPolygon {.importjs: "(new olNs_geom_Polygon.default(#, #, #))".}
proc appendLinearRing*(self: OlPolygon, linearRing: JsObject) {.importjs: "#.appendLinearRing(#)".}
proc getArea*(self: OlPolygon): float {.importjs: "#.getArea()".}
proc getEnds*(self: OlPolygon): seq[float] {.importjs: "#.getEnds()".}
proc getFlatInteriorPoint*(self: OlPolygon): seq[float] {.importjs: "#.getFlatInteriorPoint()".}
proc getInteriorPoint*(self: OlPolygon): JsObject {.importjs: "#.getInteriorPoint()".}
proc getLinearRingCount*(self: OlPolygon): float {.importjs: "#.getLinearRingCount()".}
proc getLinearRing*(self: OlPolygon, index: float): JsObject {.importjs: "#.getLinearRing(#)".}
proc getLinearRings*(self: OlPolygon): JsObject {.importjs: "#.getLinearRings()".}
proc getOrientedFlatCoordinates*(self: OlPolygon): seq[float] {.importjs: "#.getOrientedFlatCoordinates()".}

proc circular*(center: JsObject, radius: float, n: JsObject = jsUndefined, sphereRadius: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_Polygon.circular(#, #, #, #)".}
proc fromExtent*(extent: JsObject): JsObject {.importjs: "olNs_geom_Polygon.fromExtent(#)".}
proc fromCircle*(circle: JsObject, sides: JsObject = jsUndefined, angle: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_Polygon.fromCircle(#, #, #)".}
proc makeRegular*(polygon: JsObject, center: JsObject, radius: float, angle: JsObject = jsUndefined) {.importjs: "olNs_geom_Polygon.makeRegular(#, #, #, #)".}
