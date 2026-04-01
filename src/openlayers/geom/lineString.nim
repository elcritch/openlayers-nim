import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_geom_LineString from 'ol/geom/LineString.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_LineString)".}

type
  LineString* = ref object of JsRoot
proc newLineString*(coordinates: JsObject, layout: JsObject = jsUndefined): LineString {.importjs: "(new olNs_geom_LineString.default(#, #))".}
proc appendCoordinate*(self: LineString, coordinate: JsObject) {.importjs: "#.appendCoordinate(#)".}
proc forEachSegment*(self: LineString, callback: JsObject): JsObject {.importjs: "#.forEachSegment(#)".}
proc getCoordinateAtM*(self: LineString, m: float, extrapolate: JsObject = jsUndefined): JsObject {.importjs: "#.getCoordinateAtM(#, #)".}
proc getCoordinateAt*(self: LineString, fraction: float, dest: JsObject = jsUndefined): JsObject {.importjs: "#.getCoordinateAt(#, #)".}
proc getLength*(self: LineString): float {.importjs: "#.getLength()".}
proc getFlatMidpoint*(self: LineString): seq[float] {.importjs: "#.getFlatMidpoint()".}
