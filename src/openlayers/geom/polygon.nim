import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_Polygon from 'ol/geom/Polygon.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_Polygon)".}

type
  Polygon* = ref object of JsRoot
proc newPolygon*(coordinates: JsObject, layout: JsObject = jsUndefined, ends: JsObject = jsUndefined): Polygon {.importjs: "(new olNs_geom_Polygon.default(#, #, #))".}
proc appendLinearRing*(self: Polygon, linearRing: JsObject) {.importjs: "#.appendLinearRing(#)".}
proc getArea*(self: Polygon): float {.importjs: "#.getArea()".}
proc getEnds*(self: Polygon): seq[float] {.importjs: "#.getEnds()".}
proc getFlatInteriorPoint*(self: Polygon): seq[float] {.importjs: "#.getFlatInteriorPoint()".}
proc getInteriorPoint*(self: Polygon): JsObject {.importjs: "#.getInteriorPoint()".}
proc getLinearRingCount*(self: Polygon): float {.importjs: "#.getLinearRingCount()".}
proc getLinearRing*(self: Polygon, index: float): JsObject {.importjs: "#.getLinearRing(#)".}
proc getLinearRings*(self: Polygon): JsObject {.importjs: "#.getLinearRings()".}
proc getOrientedFlatCoordinates*(self: Polygon): seq[float] {.importjs: "#.getOrientedFlatCoordinates()".}

proc circular*(center: JsObject, radius: float, n: JsObject = jsUndefined, sphereRadius: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_Polygon.circular(#, #, #, #)".}
proc fromExtent*(extent: JsObject): JsObject {.importjs: "olNs_geom_Polygon.fromExtent(#)".}
proc fromCircle*(circle: JsObject, sides: JsObject = jsUndefined, angle: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_Polygon.fromCircle(#, #, #)".}
proc makeRegular*(polygon: JsObject, center: JsObject, radius: float, angle: JsObject = jsUndefined) {.importjs: "olNs_geom_Polygon.makeRegular(#, #, #, #)".}
