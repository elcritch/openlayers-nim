import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_Feature from 'ol/format/Feature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_Feature)".}

type
  FeatureFormat* = ref object of JsRoot
proc newFeatureFormat*(): FeatureFormat {.importjs: "(new olNs_format_Feature.default())".}

proc transformGeometryWithOptions*(geometry: JsObject, write: bool, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_Feature.transformGeometryWithOptions(#, #, #)".}
proc transformExtentWithOptions*(extent: JsObject, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_Feature.transformExtentWithOptions(#, #)".}
proc createRenderFeature*(objectVal: JsObject, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_Feature.createRenderFeature(#, #)".}
proc createGeometry*(objectVal: JsObject, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_Feature.createGeometry(#, #)".}

type
  ReadOptions* = ref object of JsRoot

proc newReadOptions*(): ReadOptions {.importjs: "({})".}
proc `dataProjection=`*(options: ReadOptions, value: JsObject) {.importjs: "#.dataProjection = #".}
proc `dataProjection=`*(options: ReadOptions, value: RootRef) {.importjs: "#.dataProjection = #".}
proc `extent=`*(options: ReadOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: ReadOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `featureProjection=`*(options: ReadOptions, value: JsObject) {.importjs: "#.featureProjection = #".}
proc `featureProjection=`*(options: ReadOptions, value: RootRef) {.importjs: "#.featureProjection = #".}

type
  WriteOptions* = ref object of JsRoot

proc newWriteOptions*(): WriteOptions {.importjs: "({})".}
proc `dataProjection=`*(options: WriteOptions, value: JsObject) {.importjs: "#.dataProjection = #".}
proc `dataProjection=`*(options: WriteOptions, value: RootRef) {.importjs: "#.dataProjection = #".}
proc `featureProjection=`*(options: WriteOptions, value: JsObject) {.importjs: "#.featureProjection = #".}
proc `featureProjection=`*(options: WriteOptions, value: RootRef) {.importjs: "#.featureProjection = #".}
proc `rightHanded=`*(options: WriteOptions, value: bool) {.importjs: "#.rightHanded = #".}
proc `decimals=`*(options: WriteOptions, value: float) {.importjs: "#.decimals = #".}
