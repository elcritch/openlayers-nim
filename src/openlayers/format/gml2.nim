import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GML2 from 'ol/format/GML2.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GML2)".}

type
  GML2* = ref object of JsRoot
proc newGML2*(): GML2 {.importjs: "(new olNs_format_GML2.default())".}
proc readFlatCoordinates*(self: GML2, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFlatCoordinates(#, #)".}
proc readBox*(self: GML2, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readBox(#, #)".}
proc innerBoundaryIsParser*(self: GML2, node: JsObject, objectStack: JsObject) {.importjs: "#.innerBoundaryIsParser(#, #)".}
proc outerBoundaryIsParser*(self: GML2, node: JsObject, objectStack: JsObject) {.importjs: "#.outerBoundaryIsParser(#, #)".}
proc writeFeatureElement*(self: GML2, node: JsObject, feature: JsObject, objectStack: JsObject) {.importjs: "#.writeFeatureElement(#, #, #)".}
proc writeCurveOrLineString*(self: GML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeCurveOrLineString(#, #, #)".}
proc writeLineStringOrCurveMember*(self: GML2, node: JsObject, line: JsObject, objectStack: JsObject) {.importjs: "#.writeLineStringOrCurveMember(#, #, #)".}
proc writeMultiCurveOrLineString*(self: GML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiCurveOrLineString(#, #, #)".}
proc writeGeometryElement*(self: GML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeGeometryElement(#, #, #)".}
proc writeSurfaceOrPolygon*(self: GML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeSurfaceOrPolygon(#, #, #)".}
proc writeRing*(self: GML2, node: JsObject, ring: JsObject, objectStack: JsObject) {.importjs: "#.writeRing(#, #, #)".}
proc writePoint*(self: GML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writePoint(#, #, #)".}
proc writeMultiPoint*(self: GML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiPoint(#, #, #)".}
proc writePointMember*(self: GML2, node: JsObject, point: JsObject, objectStack: JsObject) {.importjs: "#.writePointMember(#, #, #)".}
proc writeLinearRing*(self: GML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeLinearRing(#, #, #)".}
proc writeMultiSurfaceOrPolygon*(self: GML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiSurfaceOrPolygon(#, #, #)".}
proc writeSurfaceOrPolygonMember*(self: GML2, node: JsObject, polygon: JsObject, objectStack: JsObject) {.importjs: "#.writeSurfaceOrPolygonMember(#, #, #)".}
proc writeEnvelope*(self: GML2, node: JsObject, extent: JsObject, objectStack: JsObject) {.importjs: "#.writeEnvelope(#, #, #)".}
