import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WKB from 'ol/format/WKB.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WKB)".}

type
  WKB* = ref object of JsRoot
proc newWKB*(): WKB {.importjs: "(new olNs_format_WKB.default())".}

type
  WKBOptions* = ref object of JsRoot

proc newWKBOptions*(): WKBOptions {.importjs: "({})".}
proc `splitCollection=`*(options: WKBOptions, value: bool) {.importjs: "#.splitCollection = #".}
proc `hex=`*(options: WKBOptions, value: bool) {.importjs: "#.hex = #".}
proc `littleEndian=`*(options: WKBOptions, value: bool) {.importjs: "#.littleEndian = #".}
proc `ewkb=`*(options: WKBOptions, value: bool) {.importjs: "#.ewkb = #".}
proc `geometryLayout=`*(options: WKBOptions, value: JsObject) {.importjs: "#.geometryLayout = #".}
proc `geometryLayout=`*(options: WKBOptions, value: RootRef) {.importjs: "#.geometryLayout = #".}
proc `nodataZ=`*(options: WKBOptions, value: float) {.importjs: "#.nodataZ = #".}
proc `nodataM=`*(options: WKBOptions, value: float) {.importjs: "#.nodataM = #".}
proc `srid=`*(options: WKBOptions, value: float) {.importjs: "#.srid = #".}
proc `srid=`*(options: WKBOptions, value: bool) {.importjs: "#.srid = #".}

proc newWKB*(options: WKBOptions): WKB {.importjs: "(new olNs_format_WKB.default(#))".}
