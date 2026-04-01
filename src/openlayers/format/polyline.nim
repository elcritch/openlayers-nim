import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_Polyline from 'ol/format/Polyline.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_Polyline)".}

type
  Polyline* = ref object of JsRoot
proc newPolyline*(options: JsObject = jsUndefined): Polyline {.importjs: "(new olNs_format_Polyline.default(#))".}

proc encodeDeltas*(numbers: seq[float], stride: float, factor: JsObject = jsUndefined): cstring {.importjs: "olNs_format_Polyline.encodeDeltas(#, #, #)".}
proc decodeDeltas*(encoded: cstring, stride: float, factor: JsObject = jsUndefined): seq[float] {.importjs: "olNs_format_Polyline.decodeDeltas(#, #, #)".}
proc encodeFloats*(numbers: seq[float], factor: JsObject = jsUndefined): cstring {.importjs: "olNs_format_Polyline.encodeFloats(#, #)".}
proc decodeFloats*(encoded: cstring, factor: JsObject = jsUndefined): seq[float] {.importjs: "olNs_format_Polyline.decodeFloats(#, #)".}
proc encodeSignedIntegers*(numbers: seq[float]): cstring {.importjs: "olNs_format_Polyline.encodeSignedIntegers(#)".}
proc decodeSignedIntegers*(encoded: cstring): seq[float] {.importjs: "olNs_format_Polyline.decodeSignedIntegers(#)".}
proc encodeUnsignedIntegers*(numbers: seq[float]): cstring {.importjs: "olNs_format_Polyline.encodeUnsignedIntegers(#)".}
proc decodeUnsignedIntegers*(encoded: cstring): seq[float] {.importjs: "olNs_format_Polyline.decodeUnsignedIntegers(#)".}
proc encodeUnsignedInteger*(num: float): cstring {.importjs: "olNs_format_Polyline.encodeUnsignedInteger(#)".}

type
  PolylineOptions* = ref object of JsRoot

proc newPolylineOptions*(): PolylineOptions {.importjs: "({})".}
proc `factor=`*(options: PolylineOptions, value: float) {.importjs: "#.factor = #".}
proc `geometryLayout=`*(options: PolylineOptions, value: JsObject) {.importjs: "#.geometryLayout = #".}
proc `geometryLayout=`*(options: PolylineOptions, value: RootRef) {.importjs: "#.geometryLayout = #".}

proc newPolyline*(options: PolylineOptions): Polyline {.importjs: "(new olNs_format_Polyline.default(#))".}
