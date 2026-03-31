import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_Polyline from 'ol/format/Polyline.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_Polyline)".}

type
  OlPolyline* = ref object of JsRoot
proc newOlPolyline*(options: JsObject = jsUndefined): OlPolyline {.importjs: "(new olNs_format_Polyline.default(#))".}

proc encodeDeltas*(numbers: seq[float], stride: float, factor: JsObject = jsUndefined): cstring {.importjs: "olNs_format_Polyline.encodeDeltas(#, #, #)".}
proc decodeDeltas*(encoded: cstring, stride: float, factor: JsObject = jsUndefined): seq[float] {.importjs: "olNs_format_Polyline.decodeDeltas(#, #, #)".}
proc encodeFloats*(numbers: seq[float], factor: JsObject = jsUndefined): cstring {.importjs: "olNs_format_Polyline.encodeFloats(#, #)".}
proc decodeFloats*(encoded: cstring, factor: JsObject = jsUndefined): seq[float] {.importjs: "olNs_format_Polyline.decodeFloats(#, #)".}
proc encodeSignedIntegers*(numbers: seq[float]): cstring {.importjs: "olNs_format_Polyline.encodeSignedIntegers(#)".}
proc decodeSignedIntegers*(encoded: cstring): seq[float] {.importjs: "olNs_format_Polyline.decodeSignedIntegers(#)".}
proc encodeUnsignedIntegers*(numbers: seq[float]): cstring {.importjs: "olNs_format_Polyline.encodeUnsignedIntegers(#)".}
proc decodeUnsignedIntegers*(encoded: cstring): seq[float] {.importjs: "olNs_format_Polyline.decodeUnsignedIntegers(#)".}
proc encodeUnsignedInteger*(num: float): cstring {.importjs: "olNs_format_Polyline.encodeUnsignedInteger(#)".}
