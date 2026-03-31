import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Vector from 'ol/source/Vector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Vector)".}

type
  VectorSourceOptions* = ref object of JsRoot
  VectorSource* = ref object of JsRoot

proc newVectorSourceOptions*(): VectorSourceOptions {.importjs: "({})".}
proc `attributions=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `features=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.features = #".}

proc `format=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.format = #".}

proc `loader=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.loader = #".}

proc `overlaps=`*(
  options: VectorSourceOptions, value: bool
) {.importjs: "#.overlaps = #".}

proc `strategy=`*(
  options: VectorSourceOptions, value: JsObject
) {.importjs: "#.strategy = #".}

proc `url=`*(options: VectorSourceOptions, value: cstring) {.importjs: "#.url = #".}
proc `url=`*(options: VectorSourceOptions, value: JsObject) {.importjs: "#.url = #".}
proc `useSpatialIndex=`*(
  options: VectorSourceOptions, value: bool
) {.importjs: "#.useSpatialIndex = #".}

proc `wrapX=`*(options: VectorSourceOptions, value: bool) {.importjs: "#.wrapX = #".}

proc newVectorSource*(): VectorSource {.
  importjs: "(new olNs_source_Vector.default())"
.}

proc newVectorSource*(
  options: JsObject
): VectorSource {.importjs: "(new olNs_source_Vector.default(#))".}

proc newVectorSource*(
  options: VectorSourceOptions
): VectorSource {.importjs: "(new olNs_source_Vector.default(#))".}
