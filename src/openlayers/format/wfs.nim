import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WFS from 'ol/format/WFS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WFS)".}

type
  WFS* = ref object of JsRoot
proc newWFS*(options: JsObject = jsUndefined): WFS {.importjs: "(new olNs_format_WFS.default(#))".}
proc getFeatureType*(self: WFS): JsObject {.importjs: "#.getFeatureType()".}
proc setFeatureType*(self: WFS, featureType: JsObject) {.importjs: "#.setFeatureType(#)".}
proc readTransactionResponse*(self: WFS, source: JsObject): JsObject {.importjs: "#.readTransactionResponse(#)".}
proc readFeatureCollectionMetadata*(self: WFS, source: JsObject): JsObject {.importjs: "#.readFeatureCollectionMetadata(#)".}
proc readFeatureCollectionMetadataFromDocument*(self: WFS, doc: JsObject): JsObject {.importjs: "#.readFeatureCollectionMetadataFromDocument(#)".}
proc readFeatureCollectionMetadataFromNode*(self: WFS, node: JsObject): JsObject {.importjs: "#.readFeatureCollectionMetadataFromNode(#)".}
proc readTransactionResponseFromDocument*(self: WFS, doc: JsObject): JsObject {.importjs: "#.readTransactionResponseFromDocument(#)".}
proc readTransactionResponseFromNode*(self: WFS, node: JsObject): JsObject {.importjs: "#.readTransactionResponseFromNode(#)".}
proc writeGetFeature*(self: WFS, options: JsObject): JsObject {.importjs: "#.writeGetFeature(#)".}
proc combineBboxAndFilter*(self: WFS, geometryName: cstring, extent: JsObject, srsName: JsObject = jsUndefined, filter: JsObject = jsUndefined): JsObject {.importjs: "#.combineBboxAndFilter(#, #, #, #)".}
proc writeTransaction*(self: WFS, inserts: JsObject, updates: JsObject, deletes: JsObject, options: JsObject): JsObject {.importjs: "#.writeTransaction(#, #, #, #)".}

proc writeFilter*(filter: JsObject, version: cstring): JsObject {.importjs: "olNs_format_WFS.writeFilter(#, #)".}
