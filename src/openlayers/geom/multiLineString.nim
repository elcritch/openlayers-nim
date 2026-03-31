import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_MultiLineString from 'ol/geom/MultiLineString.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_MultiLineString)".}

type MultiLineString* = ref object of JsRoot
proc newMultiLineString*(
  coordinates: JsObject, layout: JsObject = jsUndefined, ends: JsObject = jsUndefined
): MultiLineString {.importjs: "(new olNs_geom_MultiLineString.default(#, #, #))".}

proc appendLineString*(
  self: MultiLineString, lineString: JsObject
) {.importjs: "#.appendLineString(#)".}

proc getCoordinateAtM*(
  self: MultiLineString,
  m: float,
  extrapolate: JsObject = jsUndefined,
  interpolate: JsObject = jsUndefined,
): JsObject {.importjs: "#.getCoordinateAtM(#, #, #)".}

proc getEnds*(self: MultiLineString): seq[float] {.importjs: "#.getEnds()".}
proc getLineString*(
  self: MultiLineString, index: float
): JsObject {.importjs: "#.getLineString(#)".}

proc getLineStrings*(self: MultiLineString): JsObject {.importjs: "#.getLineStrings()".}
proc getLength*(self: MultiLineString): float {.importjs: "#.getLength()".}
proc getFlatMidpoints*(
  self: MultiLineString
): seq[float] {.importjs: "#.getFlatMidpoints()".}
