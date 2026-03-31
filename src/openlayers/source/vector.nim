import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Vector from 'ol/source/Vector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Vector)".}

type
  OlVectorSourceOptions* = ref object of JsRoot
  OlVectorSource* = ref object of JsRoot

proc newOlVectorSourceOptions*(): OlVectorSourceOptions {.importjs: "({})".}
proc `attributions=`*(
  options: OlVectorSourceOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `features=`*(
  options: OlVectorSourceOptions, value: JsObject
) {.importjs: "#.features = #".}

proc `format=`*(
  options: OlVectorSourceOptions, value: JsObject
) {.importjs: "#.format = #".}

proc `loader=`*(
  options: OlVectorSourceOptions, value: JsObject
) {.importjs: "#.loader = #".}

proc `overlaps=`*(
  options: OlVectorSourceOptions, value: bool
) {.importjs: "#.overlaps = #".}

proc `strategy=`*(
  options: OlVectorSourceOptions, value: JsObject
) {.importjs: "#.strategy = #".}

proc `url=`*(options: OlVectorSourceOptions, value: cstring) {.importjs: "#.url = #".}
proc `url=`*(options: OlVectorSourceOptions, value: JsObject) {.importjs: "#.url = #".}
proc `useSpatialIndex=`*(
  options: OlVectorSourceOptions, value: bool
) {.importjs: "#.useSpatialIndex = #".}

proc `wrapX=`*(options: OlVectorSourceOptions, value: bool) {.importjs: "#.wrapX = #".}

proc newOlVectorSource*(): OlVectorSource {.
  importjs: "(new olNs_source_Vector.default())"
.}

proc newOlVectorSource*(
  options: JsObject
): OlVectorSource {.importjs: "(new olNs_source_Vector.default(#))".}

proc newOlVectorSource*(
  options: OlVectorSourceOptions
): OlVectorSource {.importjs: "(new olNs_source_Vector.default(#))".}
