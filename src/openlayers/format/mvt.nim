import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_MVT from 'ol/format/MVT.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_MVT)".}

type MVT* = ref object of JsRoot
proc newMVT*(
  options: JsObject = jsUndefined
): MVT {.importjs: "(new olNs_format_MVT.default(#))".}

proc setLayers*(self: MVT, layers: seq[cstring]) {.importjs: "#.setLayers(#)".}

type MVTOptions* = ref object of JsRoot

proc newMVTOptions*(): MVTOptions {.importjs: "({})".}
proc `featureClass=`*(
  options: MVTOptions, value: JsObject
) {.importjs: "#.featureClass = #".}

proc `featureClass=`*(
  options: MVTOptions, value: RootRef
) {.importjs: "#.featureClass = #".}

proc `geometryName=`*(
  options: MVTOptions, value: cstring
) {.importjs: "#.geometryName = #".}

proc `layerName=`*(options: MVTOptions, value: cstring) {.importjs: "#.layerName = #".}
proc `layers=`*(options: MVTOptions, value: seq[cstring]) {.importjs: "#.layers = #".}
proc `idProperty=`*(
  options: MVTOptions, value: cstring
) {.importjs: "#.idProperty = #".}

proc newMVT*(options: MVTOptions): MVT {.importjs: "(new olNs_format_MVT.default(#))".}
