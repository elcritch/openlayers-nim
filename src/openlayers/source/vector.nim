import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_Vector from 'ol/source/Vector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Vector)".}

type VectorSource* = ref object of JsRoot
proc newVectorSource*(): VectorSource {.importjs: "(new olNs_source_Vector.default())".}
proc getFeatures*(self: VectorSource): seq[JsObject] {.importjs: "#.getFeatures()".}
proc addFeature*(self: VectorSource, feature: JsObject) {.importjs: "#.addFeature(#)".}
proc addFeature*(self: VectorSource, feature: RootRef) {.importjs: "#.addFeature(#)".}
proc addFeatures*(self: VectorSource, features: JsObject) {.importjs: "#.addFeatures(#)".}
proc addFeatures*(self: VectorSource, features: RootRef) {.importjs: "#.addFeatures(#)".}
proc clear*(self: VectorSource, fast: bool = false) {.importjs: "#.clear(#)".}

type VectorSourceOptions* = ref object of JsRoot

proc newVectorSourceOptions*(): VectorSourceOptions {.importjs: "({})".}
proc `attributions=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: VectorSourceOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: VectorSourceOptions, value: cstring
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: VectorSourceOptions, value: seq[cstring]
) {.importjs: "#.attributions = #".}

proc `features=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.features = #".}

proc `features=`*(
  options: VectorSourceOptions, value: RootRef
) {.importjs: "#.features = #".}

proc `features=`*[T](
  options: VectorSourceOptions, value: seq[T]
) {.importjs: "#.features = #".}

proc `format=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.format = #".}

proc `format=`*(
  options: VectorSourceOptions, value: RootRef
) {.importjs: "#.format = #".}

proc `loader=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.loader = #".}

proc `loader=`*(
  options: VectorSourceOptions, value: RootRef
) {.importjs: "#.loader = #".}

proc `overlaps=`*(
  options: VectorSourceOptions, value: bool
) {.importjs: "#.overlaps = #".}

proc `strategy=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.strategy = #".}

proc `strategy=`*(
  options: VectorSourceOptions, value: RootRef
) {.importjs: "#.strategy = #".}

proc `url=`*(options: VectorSourceOptions, value: cstring) {.importjs: "#.url = #".}
proc `url=`*(options: VectorSourceOptions, value: JsObject) {.importjs: "#.url = #".}
proc `url=`*(options: VectorSourceOptions, value: RootRef) {.importjs: "#.url = #".}
proc `useSpatialIndex=`*(
  options: VectorSourceOptions, value: bool
) {.importjs: "#.useSpatialIndex = #".}

proc `wrapX=`*(options: VectorSourceOptions, value: bool) {.importjs: "#.wrapX = #".}

proc newVectorSource*(
  options: VectorSourceOptions
): VectorSource {.importjs: "(new olNs_source_Vector.default(#))".}
