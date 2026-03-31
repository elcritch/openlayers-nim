import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GMLBase from 'ol/format/GMLBase.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GMLBase)".}

type
  OlGMLBase* = ref object of JsRoot
proc newOlGMLBase*(options: JsObject = jsUndefined): OlGMLBase {.importjs: "(new olNs_format_GMLBase.default(#))".}
proc readFeaturesInternal*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFeaturesInternal(#, #)".}
proc readGeometryOrExtent*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readGeometryOrExtent(#, #)".}
proc readExtentElement*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readExtentElement(#, #)".}
proc readGeometryElement*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readGeometryElement(#, #)".}
proc readFeatureElementInternal*(self: OlGMLBase, node: JsObject, objectStack: JsObject, asFeature: bool): JsObject {.importjs: "#.readFeatureElementInternal(#, #, #)".}
proc readFeatureElement*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFeatureElement(#, #)".}
proc readPoint*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readPoint(#, #)".}
proc readMultiPoint*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readMultiPoint(#, #)".}
proc readMultiLineString*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readMultiLineString(#, #)".}
proc readMultiPolygon*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readMultiPolygon(#, #)".}
proc pointMemberParser*(self: OlGMLBase, node: JsObject, objectStack: JsObject) {.importjs: "#.pointMemberParser(#, #)".}
proc lineStringMemberParser*(self: OlGMLBase, node: JsObject, objectStack: JsObject) {.importjs: "#.lineStringMemberParser(#, #)".}
proc polygonMemberParser*(self: OlGMLBase, node: JsObject, objectStack: JsObject) {.importjs: "#.polygonMemberParser(#, #)".}
proc readLineString*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readLineString(#, #)".}
proc readFlatLinearRing*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readFlatLinearRing(#, #)".}
proc readLinearRing*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readLinearRing(#, #)".}
proc readPolygon*(self: OlGMLBase, node: JsObject, objectStack: JsObject): JsObject {.importjs: "#.readPolygon(#, #)".}
proc readFlatCoordinatesFromNode*(self: OlGMLBase, node: JsObject, objectStack: JsObject): seq[float] {.importjs: "#.readFlatCoordinatesFromNode(#, #)".}

proc getGMLNS*(): cstring {.importjs: "(olNs_format_GMLBase.GMLNS)".}
