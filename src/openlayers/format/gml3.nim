import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GML3 from 'ol/format/GML3.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GML3)".}

type GML3* = ref object of JsRoot
proc newGML3*(): GML3 {.importjs: "(new olNs_format_GML3.default())".}
proc readMultiCurve*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readMultiCurve(#, #)".}

proc readFlatCurveRing*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readFlatCurveRing(#, #)".}

proc readMultiSurface*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readMultiSurface(#, #)".}

proc curveMemberParser*(
  self: GML3, node: JsObject, objectStack: JsObject
) {.importjs: "#.curveMemberParser(#, #)".}

proc surfaceMemberParser*(
  self: GML3, node: JsObject, objectStack: JsObject
) {.importjs: "#.surfaceMemberParser(#, #)".}

proc readPatch*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readPatch(#, #)".}

proc readSegment*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readSegment(#, #)".}

proc readPolygonPatch*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readPolygonPatch(#, #)".}

proc readLineStringSegment*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readLineStringSegment(#, #)".}

proc interiorParser*(
  self: GML3, node: JsObject, objectStack: JsObject
) {.importjs: "#.interiorParser(#, #)".}

proc exteriorParser*(
  self: GML3, node: JsObject, objectStack: JsObject
) {.importjs: "#.exteriorParser(#, #)".}

proc readSurface*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readSurface(#, #)".}

proc readCurve*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readCurve(#, #)".}

proc readEnvelope*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readEnvelope(#, #)".}

proc readFlatPos*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readFlatPos(#, #)".}

proc readFlatPosList*(
  self: GML3, node: JsObject, objectStack: JsObject
): JsObject {.importjs: "#.readFlatPosList(#, #)".}

proc writePoint*(
  self: GML3, node: JsObject, geometry: JsObject, objectStack: JsObject
) {.importjs: "#.writePoint(#, #, #)".}

proc writeEnvelope*(
  self: GML3, node: JsObject, extent: JsObject, objectStack: JsObject
) {.importjs: "#.writeEnvelope(#, #, #)".}

proc writeLinearRing*(
  self: GML3, node: JsObject, geometry: JsObject, objectStack: JsObject
) {.importjs: "#.writeLinearRing(#, #, #)".}

proc writeSurfaceOrPolygon*(
  self: GML3, node: JsObject, geometry: JsObject, objectStack: JsObject
) {.importjs: "#.writeSurfaceOrPolygon(#, #, #)".}

proc writeCurveOrLineString*(
  self: GML3, node: JsObject, geometry: JsObject, objectStack: JsObject
) {.importjs: "#.writeCurveOrLineString(#, #, #)".}

proc writeMultiSurfaceOrPolygon*(
  self: GML3, node: JsObject, geometry: JsObject, objectStack: JsObject
) {.importjs: "#.writeMultiSurfaceOrPolygon(#, #, #)".}

proc writeMultiPoint*(
  self: GML3, node: JsObject, geometry: JsObject, objectStack: JsObject
) {.importjs: "#.writeMultiPoint(#, #, #)".}

proc writeMultiCurveOrLineString*(
  self: GML3, node: JsObject, geometry: JsObject, objectStack: JsObject
) {.importjs: "#.writeMultiCurveOrLineString(#, #, #)".}

proc writeRing*(
  self: GML3, node: JsObject, ring: JsObject, objectStack: JsObject
) {.importjs: "#.writeRing(#, #, #)".}

proc writeSurfaceOrPolygonMember*(
  self: GML3, node: JsObject, polygon: JsObject, objectStack: JsObject
) {.importjs: "#.writeSurfaceOrPolygonMember(#, #, #)".}

proc writePointMember*(
  self: GML3, node: JsObject, point: JsObject, objectStack: JsObject
) {.importjs: "#.writePointMember(#, #, #)".}

proc writeLineStringOrCurveMember*(
  self: GML3, node: JsObject, line: JsObject, objectStack: JsObject
) {.importjs: "#.writeLineStringOrCurveMember(#, #, #)".}

proc writeGeometryElement*(
  self: GML3, node: JsObject, geometry: JsObject, objectStack: JsObject
) {.importjs: "#.writeGeometryElement(#, #, #)".}

proc writeFeatureElement*(
  self: GML3, node: JsObject, feature: JsObject, objectStack: JsObject
) {.importjs: "#.writeFeatureElement(#, #, #)".}
