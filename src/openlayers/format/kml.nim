import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_KML from 'ol/format/KML.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_KML)".}

type
  KML* = ref object of JsRoot
proc newKML*(options: JsObject = jsUndefined): KML {.importjs: "(new olNs_format_KML.default(#))".}
proc readName*(self: KML, source: JsObject): cstring {.importjs: "#.readName(#)".}
proc readNameFromDocument*(self: KML, doc: JsObject): cstring {.importjs: "#.readNameFromDocument(#)".}
proc readNameFromNode*(self: KML, node: JsObject): cstring {.importjs: "#.readNameFromNode(#)".}
proc readNetworkLinks*(self: KML, source: JsObject): JsObject {.importjs: "#.readNetworkLinks(#)".}
proc readNetworkLinksFromDocument*(self: KML, doc: JsObject): JsObject {.importjs: "#.readNetworkLinksFromDocument(#)".}
proc readNetworkLinksFromNode*(self: KML, node: JsObject): JsObject {.importjs: "#.readNetworkLinksFromNode(#)".}
proc readRegion*(self: KML, source: JsObject): JsObject {.importjs: "#.readRegion(#)".}
proc readRegionFromDocument*(self: KML, doc: JsObject): JsObject {.importjs: "#.readRegionFromDocument(#)".}
proc readRegionFromNode*(self: KML, node: JsObject): JsObject {.importjs: "#.readRegionFromNode(#)".}
proc readCamera*(self: KML, source: JsObject): JsObject {.importjs: "#.readCamera(#)".}
proc readCameraFromDocument*(self: KML, doc: JsObject): JsObject {.importjs: "#.readCameraFromDocument(#)".}
proc readCameraFromNode*(self: KML, node: JsObject): JsObject {.importjs: "#.readCameraFromNode(#)".}

proc getDefaultFillStyle*(): JsObject {.importjs: "olNs_format_KML.getDefaultFillStyle()".}
proc getDefaultImageStyle*(): JsObject {.importjs: "olNs_format_KML.getDefaultImageStyle()".}
proc getDefaultStrokeStyle*(): JsObject {.importjs: "olNs_format_KML.getDefaultStrokeStyle()".}
proc getDefaultTextStyle*(): JsObject {.importjs: "olNs_format_KML.getDefaultTextStyle()".}
proc getDefaultStyle*(): JsObject {.importjs: "olNs_format_KML.getDefaultStyle()".}
proc getDefaultStyleArray*(): JsObject {.importjs: "olNs_format_KML.getDefaultStyleArray()".}
proc readFlatCoordinates*(node: JsObject): JsObject {.importjs: "olNs_format_KML.readFlatCoordinates(#)".}
