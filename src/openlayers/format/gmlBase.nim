import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_GMLBase from 'ol/format/GMLBase.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GMLBase)".}

type
  GMLBase* = ref object of JsRoot
proc newGMLBase*(options: JsObject = jsUndefined): GMLBase {.importjs: "(new olNs_format_GMLBase.default(#))".}
proc readFeaturesInternal*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFeaturesInternal(#, #)".}
proc readGeometryOrExtent*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readGeometryOrExtent(#, #)".}
proc readExtentElement*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readExtentElement(#, #)".}
proc readGeometryElement*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readGeometryElement(#, #)".}
proc readFeatureElementInternal*(self: GMLBase, node: JsObject, objectStack: JsObject, asFeature: bool): JsObject {.importjs: "#.readFeatureElementInternal(#, #, #)".}
proc readFeatureElement*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFeatureElement(#, #)".}
proc readPoint*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readPoint(#, #)".}
proc readMultiPoint*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readMultiPoint(#, #)".}
proc readMultiLineString*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readMultiLineString(#, #)".}
proc readMultiPolygon*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readMultiPolygon(#, #)".}
proc pointMemberParser*(self: GMLBase, node: JsObject, objectStack: JsObject) {.importjs: "#.pointMemberParser(#, #)".}
proc lineStringMemberParser*(self: GMLBase, node: JsObject, objectStack: JsObject) {.importjs: "#.lineStringMemberParser(#, #)".}
proc polygonMemberParser*(self: GMLBase, node: JsObject, objectStack: JsObject) {.importjs: "#.polygonMemberParser(#, #)".}
proc readLineString*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readLineString(#, #)".}
proc readFlatLinearRing*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFlatLinearRing(#, #)".}
proc readLinearRing*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readLinearRing(#, #)".}
proc readPolygon*(self: GMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readPolygon(#, #)".}
proc readFlatCoordinatesFromNode*(self: GMLBase, node: JsObject, objectStack: JsObject): seq[float] {.importjs: "#.readFlatCoordinatesFromNode(#, #)".}

proc getGMLNS*(): cstring {.importjs: "(olNs_format_GMLBase.GMLNS)".}

type
  GMLBaseOptions* = ref object of JsRoot

proc newGMLBaseOptions*(): GMLBaseOptions {.importjs: "({})".}
proc `featureNS=`*(options: GMLBaseOptions, value: cstring) {.importjs: "#.featureNS = #".}
proc `featureNS=`*(options: GMLBaseOptions, value: JsObject) {.importjs: "#.featureNS = #".}
proc `featureNS=`*(options: GMLBaseOptions, value: RootRef) {.importjs: "#.featureNS = #".}
proc `featureType=`*(options: GMLBaseOptions, value: cstring) {.importjs: "#.featureType = #".}
proc `featureType=`*(options: GMLBaseOptions, value: seq[cstring]) {.importjs: "#.featureType = #".}
proc `srsName=`*(options: GMLBaseOptions, value: cstring) {.importjs: "#.srsName = #".}
proc `surface=`*(options: GMLBaseOptions, value: bool) {.importjs: "#.surface = #".}
proc `curve=`*(options: GMLBaseOptions, value: bool) {.importjs: "#.curve = #".}
proc `multiCurve=`*(options: GMLBaseOptions, value: bool) {.importjs: "#.multiCurve = #".}
proc `multiSurface=`*(options: GMLBaseOptions, value: bool) {.importjs: "#.multiSurface = #".}
proc `schemaLocation=`*(options: GMLBaseOptions, value: cstring) {.importjs: "#.schemaLocation = #".}
proc `hasZ=`*(options: GMLBaseOptions, value: bool) {.importjs: "#.hasZ = #".}

proc newGMLBase*(options: GMLBaseOptions): GMLBase {.importjs: "(new olNs_format_GMLBase.default(#))".}
