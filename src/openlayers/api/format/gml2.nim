import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GML2 from 'ol/format/GML2.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GML2)".}

type
  OlGML2* = ref object of JsRoot
proc newOlGML2*(): OlGML2 {.importjs: "(new olNs_format_GML2.default())".}
proc readFlatCoordinates*(self: OlGML2, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFlatCoordinates(#, #)".}
proc readBox*(self: OlGML2, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readBox(#, #)".}
proc innerBoundaryIsParser*(self: OlGML2, node: JsObject, objectStack: JsObject) {.importjs: "#.innerBoundaryIsParser(#, #)".}
proc outerBoundaryIsParser*(self: OlGML2, node: JsObject, objectStack: JsObject) {.importjs: "#.outerBoundaryIsParser(#, #)".}
proc writeFeatureElement*(self: OlGML2, node: JsObject, feature: JsObject, objectStack: JsObject) {.importjs: "#.writeFeatureElement(#, #, #)".}
proc writeCurveOrLineString*(self: OlGML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeCurveOrLineString(#, #, #)".}
proc writeLineStringOrCurveMember*(self: OlGML2, node: JsObject, line: JsObject, objectStack: JsObject) {.importjs: "#.writeLineStringOrCurveMember(#, #, #)".}
proc writeMultiCurveOrLineString*(self: OlGML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiCurveOrLineString(#, #, #)".}
proc writeGeometryElement*(self: OlGML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeGeometryElement(#, #, #)".}
proc writeSurfaceOrPolygon*(self: OlGML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeSurfaceOrPolygon(#, #, #)".}
proc writeRing*(self: OlGML2, node: JsObject, ring: JsObject, objectStack: JsObject) {.importjs: "#.writeRing(#, #, #)".}
proc writePoint*(self: OlGML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writePoint(#, #, #)".}
proc writeMultiPoint*(self: OlGML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiPoint(#, #, #)".}
proc writePointMember*(self: OlGML2, node: JsObject, point: JsObject, objectStack: JsObject) {.importjs: "#.writePointMember(#, #, #)".}
proc writeLinearRing*(self: OlGML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeLinearRing(#, #, #)".}
proc writeMultiSurfaceOrPolygon*(self: OlGML2, node: JsObject, geometry: JsObject, objectStack: JsObject) {.importjs: "#.writeMultiSurfaceOrPolygon(#, #, #)".}
proc writeSurfaceOrPolygonMember*(self: OlGML2, node: JsObject, polygon: JsObject, objectStack: JsObject) {.importjs: "#.writeSurfaceOrPolygonMember(#, #, #)".}
proc writeEnvelope*(self: OlGML2, node: JsObject, extent: JsObject, objectStack: JsObject) {.importjs: "#.writeEnvelope(#, #, #)".}
