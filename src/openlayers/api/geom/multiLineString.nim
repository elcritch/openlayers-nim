import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_MultiLineString from 'ol/geom/MultiLineString.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_MultiLineString)".}

type
  OlMultiLineString* = ref object of JsRoot
proc newOlMultiLineString*(coordinates: JsObject, layout: JsObject = jsUndefined, ends: JsObject = jsUndefined): OlMultiLineString {.importjs: "(new olNs_geom_MultiLineString.default(#, #, #))".}
proc appendLineString*(self: OlMultiLineString, lineString: JsObject) {.importjs: "#.appendLineString(#)".}
proc getCoordinateAtM*(self: OlMultiLineString, m: float, extrapolate: JsObject = jsUndefined, interpolate: JsObject = jsUndefined): JsObject {.importjs: "#.getCoordinateAtM(#, #, #)".}
proc getEnds*(self: OlMultiLineString): seq[float] {.importjs: "#.getEnds()".}
proc getLineString*(self: OlMultiLineString, index: float): JsObject {.importjs: "#.getLineString(#)".}
proc getLineStrings*(self: OlMultiLineString): JsObject {.importjs: "#.getLineStrings()".}
proc getLength*(self: OlMultiLineString): float {.importjs: "#.getLength()".}
proc getFlatMidpoints*(self: OlMultiLineString): seq[float] {.importjs: "#.getFlatMidpoints()".}
