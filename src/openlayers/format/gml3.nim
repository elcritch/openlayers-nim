import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GML3 from 'ol/format/GML3.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GML3)".}

type
  OlGML3* = ref object of JsRoot
proc newOlGML3*(): OlGML3 {.importjs: "(new olNs_format_GML3.default())".}
proc readMultiCurve*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readMultiCurve(#, #)".}
proc readFlatCurveRing*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFlatCurveRing(#, #)".}
proc readMultiSurface*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readMultiSurface(#, #)".}
proc curveMemberParser*(self: OlGML3, node: JsObject, objectStack: JsObject) {.importjs: "#.curveMemberParser(#, #)".}
proc surfaceMemberParser*(self: OlGML3, node: JsObject, objectStack: JsObject) {.importjs: "#.surfaceMemberParser(#, #)".}
proc readPatch*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readPatch(#, #)".}
proc readSegment*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readSegment(#, #)".}
proc readPolygonPatch*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readPolygonPatch(#, #)".}
proc readLineStringSegment*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readLineStringSegment(#, #)".}
proc interiorParser*(self: OlGML3, node: JsObject, objectStack: JsObject) {.importjs: "#.interiorParser(#, #)".}
proc exteriorParser*(self: OlGML3, node: JsObject, objectStack: JsObject) {.importjs: "#.exteriorParser(#, #)".}
proc readSurface*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readSurface(#, #)".}
proc readCurve*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readCurve(#, #)".}
proc readEnvelope*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readEnvelope(#, #)".}
proc readFlatPos*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFlatPos(#, #)".}
proc readFlatPosList*(self: OlGML3, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFlatPosList(#, #)".}
proc writePoint*(self: OlGML3, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writePoint(#, #, #)".}
proc writeEnvelope*(self: OlGML3, node: JsObject, extent: JsObject, objectStack: JsObject) {.importjs: "#.writeEnvelope(#, #, #)".}
proc writeLinearRing*(self: OlGML3, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeLinearRing(#, #, #)".}
proc writeSurfaceOrPolygon*(self: OlGML3, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeSurfaceOrPolygon(#, #, #)".}
proc writeCurveOrLineString*(self: OlGML3, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeCurveOrLineString(#, #, #)".}
proc writeMultiSurfaceOrPolygon*(self: OlGML3, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiSurfaceOrPolygon(#, #, #)".}
proc writeMultiPoint*(self: OlGML3, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiPoint(#, #, #)".}
proc writeMultiCurveOrLineString*(self: OlGML3, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiCurveOrLineString(#, #, #)".}
proc writeRing*(self: OlGML3, node: JsObject, ring: JsObject, objectStack: JsObject) {.importjs: "#.writeRing(#, #, #)".}
proc writeSurfaceOrPolygonMember*(self: OlGML3, node: JsObject, polygon: JsObject, objectStack: JsObject) {.importjs: "#.writeSurfaceOrPolygonMember(#, #, #)".}
proc writePointMember*(self: OlGML3, node: JsObject, point: JsObject, objectStack: JsObject) {.importjs: "#.writePointMember(#, #, #)".}
proc writeLineStringOrCurveMember*(self: OlGML3, node: JsObject, line: JsObject, objectStack: JsObject) {.importjs: "#.writeLineStringOrCurveMember(#, #, #)".}
proc writeGeometryElement*(self: OlGML3, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeGeometryElement(#, #, #)".}
proc writeFeatureElement*(self: OlGML3, node: JsObject, feature: JsObject, objectStack: JsObject) {.importjs: "#.writeFeatureElement(#, #, #)".}
