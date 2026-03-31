import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WFS from 'ol/format/WFS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WFS)".}

type
  OlWFS* = ref object of JsRoot
proc newOlWFS*(options: JsObject = jsUndefined): OlWFS {.importjs: "(new olNs_format_WFS.default(#))".}
proc getFeatureType*(self: OlWFS): JsObject {.importjs: "#.getFeatureType()".}
proc setFeatureType*(self: OlWFS, featureType: JsObject) {.importjs: "#.setFeatureType(#)".}
proc readTransactionResponse*(self: OlWFS, source: JsObject): JsObject {.importjs: "#.readTransactionResponse(#)".}
proc readFeatureCollectionMetadata*(self: OlWFS, source: JsObject): JsObject {.importjs: "#.readFeatureCollectionMetadata(#)".}
proc readFeatureCollectionMetadataFromDocument*(self: OlWFS, doc: JsObject): JsObject {.importjs: "#.readFeatureCollectionMetadataFromDocument(#)".}
proc readFeatureCollectionMetadataFromNode*(self: OlWFS, node: JsObject): JsObject {.importjs: "#.readFeatureCollectionMetadataFromNode(#)".}
proc readTransactionResponseFromDocument*(self: OlWFS, doc: JsObject): JsObject {.importjs: "#.readTransactionResponseFromDocument(#)".}
proc readTransactionResponseFromNode*(self: OlWFS, node: JsObject): JsObject {.importjs: "#.readTransactionResponseFromNode(#)".}
proc writeGetFeature*(self: OlWFS, options: JsObject): JsObject {.importjs: "#.writeGetFeature(#)".}
proc combineBboxAndFilter*(self: OlWFS, geometryName: cstring, extent: JsObject, srsName: JsObject = jsUndefined, filter: JsObject = jsUndefined): JsObject {.importjs: "#.combineBboxAndFilter(#, #, #, #)".}
proc writeTransaction*(self: OlWFS, inserts: JsObject, updates: JsObject, deletes: JsObject, options: JsObject): JsObject {.importjs: "#.writeTransaction(#, #, #, #)".}

proc writeFilter*(filter: JsObject, version: cstring): JsObject {.importjs: "olNs_format_WFS.writeFilter(#, #)".}
