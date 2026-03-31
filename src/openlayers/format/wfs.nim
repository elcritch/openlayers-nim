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

type
  WFSOptions* = ref object of JsRoot

proc newWFSOptions*(): WFSOptions {.importjs: "({})".}
proc `featureNS=`*(options: WFSOptions, value: cstring) {.importjs: "#.featureNS = #".}
proc `featureNS=`*(options: WFSOptions, value: JsObject) {.importjs: "#.featureNS = #".}
proc `featureNS=`*(options: WFSOptions, value: RootRef) {.importjs: "#.featureNS = #".}
proc `featureType=`*(options: WFSOptions, value: cstring) {.importjs: "#.featureType = #".}
proc `featureType=`*(options: WFSOptions, value: seq[cstring]) {.importjs: "#.featureType = #".}
proc `gmlFormat=`*(options: WFSOptions, value: JsObject) {.importjs: "#.gmlFormat = #".}
proc `gmlFormat=`*(options: WFSOptions, value: RootRef) {.importjs: "#.gmlFormat = #".}
proc `schemaLocation=`*(options: WFSOptions, value: cstring) {.importjs: "#.schemaLocation = #".}
proc `version=`*(options: WFSOptions, value: cstring) {.importjs: "#.version = #".}

proc newWFS*(options: WFSOptions): WFS {.importjs: "(new olNs_format_WFS.default(#))".}

type
  WriteGetFeatureOptions* = ref object of JsRoot

proc newWriteGetFeatureOptions*(): WriteGetFeatureOptions {.importjs: "({})".}
proc `featureNS=`*(options: WriteGetFeatureOptions, value: cstring) {.importjs: "#.featureNS = #".}
proc `featurePrefix=`*(options: WriteGetFeatureOptions, value: cstring) {.importjs: "#.featurePrefix = #".}
proc `featureTypes=`*(options: WriteGetFeatureOptions, value: JsObject) {.importjs: "#.featureTypes = #".}
proc `featureTypes=`*(options: WriteGetFeatureOptions, value: RootRef) {.importjs: "#.featureTypes = #".}
proc `featureTypes=`*[T](options: WriteGetFeatureOptions, value: seq[T]) {.importjs: "#.featureTypes = #".}
proc `srsName=`*(options: WriteGetFeatureOptions, value: cstring) {.importjs: "#.srsName = #".}
proc `handle=`*(options: WriteGetFeatureOptions, value: cstring) {.importjs: "#.handle = #".}
proc `outputFormat=`*(options: WriteGetFeatureOptions, value: cstring) {.importjs: "#.outputFormat = #".}
proc `maxFeatures=`*(options: WriteGetFeatureOptions, value: float) {.importjs: "#.maxFeatures = #".}
proc `geometryName=`*(options: WriteGetFeatureOptions, value: cstring) {.importjs: "#.geometryName = #".}
proc `propertyNames=`*(options: WriteGetFeatureOptions, value: seq[cstring]) {.importjs: "#.propertyNames = #".}
proc `viewParams=`*(options: WriteGetFeatureOptions, value: cstring) {.importjs: "#.viewParams = #".}
proc `startIndex=`*(options: WriteGetFeatureOptions, value: float) {.importjs: "#.startIndex = #".}
proc `count=`*(options: WriteGetFeatureOptions, value: float) {.importjs: "#.count = #".}
proc `bbox=`*(options: WriteGetFeatureOptions, value: JsObject) {.importjs: "#.bbox = #".}
proc `bbox=`*(options: WriteGetFeatureOptions, value: RootRef) {.importjs: "#.bbox = #".}
proc `filter=`*(options: WriteGetFeatureOptions, value: JsObject) {.importjs: "#.filter = #".}
proc `filter=`*(options: WriteGetFeatureOptions, value: RootRef) {.importjs: "#.filter = #".}
proc `resultType=`*(options: WriteGetFeatureOptions, value: cstring) {.importjs: "#.resultType = #".}

type
  WriteTransactionOptions* = ref object of JsRoot

proc newWriteTransactionOptions*(): WriteTransactionOptions {.importjs: "({})".}
proc `featureNS=`*(options: WriteTransactionOptions, value: cstring) {.importjs: "#.featureNS = #".}
proc `featurePrefix=`*(options: WriteTransactionOptions, value: cstring) {.importjs: "#.featurePrefix = #".}
proc `featureType=`*(options: WriteTransactionOptions, value: cstring) {.importjs: "#.featureType = #".}
proc `srsName=`*(options: WriteTransactionOptions, value: cstring) {.importjs: "#.srsName = #".}
proc `handle=`*(options: WriteTransactionOptions, value: cstring) {.importjs: "#.handle = #".}
proc `hasZ=`*(options: WriteTransactionOptions, value: bool) {.importjs: "#.hasZ = #".}
proc `nativeElements=`*(options: WriteTransactionOptions, value: JsObject) {.importjs: "#.nativeElements = #".}
proc `nativeElements=`*(options: WriteTransactionOptions, value: RootRef) {.importjs: "#.nativeElements = #".}
proc `nativeElements=`*[T](options: WriteTransactionOptions, value: seq[T]) {.importjs: "#.nativeElements = #".}
proc `gmlOptions=`*(options: WriteTransactionOptions, value: JsObject) {.importjs: "#.gmlOptions = #".}
proc `gmlOptions=`*(options: WriteTransactionOptions, value: RootRef) {.importjs: "#.gmlOptions = #".}
proc `version=`*(options: WriteTransactionOptions, value: cstring) {.importjs: "#.version = #".}
