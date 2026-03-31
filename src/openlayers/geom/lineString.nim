import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_LineString from 'ol/geom/LineString.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_LineString)".}

type
  OlLineString* = ref object of JsRoot
proc newOlLineString*(coordinates: JsObject, layout: JsObject = jsUndefined): OlLineString {.importjs: "(new olNs_geom_LineString.default(#, #))".}
proc appendCoordinate*(self: OlLineString, coordinate: JsObject) {.importjs: "#.appendCoordinate(#)".}
proc forEachSegment*(self: OlLineString, callback: JsObject): JsObject {.importjs: "#.forEachSegment(#)".}
proc getCoordinateAtM*(self: OlLineString, m: float, extrapolate: JsObject = jsUndefined): JsObject {.importjs: "#.getCoordinateAtM(#, #)".}
proc getCoordinateAt*(self: OlLineString, fraction: float, dest: JsObject = jsUndefined): JsObject {.importjs: "#.getCoordinateAt(#, #)".}
proc getLength*(self: OlLineString): float {.importjs: "#.getLength()".}
proc getFlatMidpoint*(self: OlLineString): seq[float] {.importjs: "#.getFlatMidpoint()".}
