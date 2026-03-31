import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_VectorTile from 'ol/VectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_VectorTile)".}

type VectorTile* = ref object of JsRoot
proc newVectorTile*(
  tileCoord: JsObject,
  state: JsObject,
  src: cstring,
  format: JsObject,
  tileLoadFunction: JsObject,
  options: JsObject = jsUndefined,
): VectorTile {.importjs: "(new olNs_VectorTile.default(#, #, #, #, #, #))".}

proc getTileUrl*(self: VectorTile): cstring {.importjs: "#.getTileUrl()".}
proc getFormat*(self: VectorTile): JsObject {.importjs: "#.getFormat()".}
proc getFeatures*(self: VectorTile): JsObject {.importjs: "#.getFeatures()".}
proc onLoad*(
  self: VectorTile, features: JsObject, dataProjection: JsObject
) {.importjs: "#.onLoad(#, #)".}

proc onError*(self: VectorTile) {.importjs: "#.onError()".}
proc setFeatures*(self: VectorTile, features: JsObject) {.importjs: "#.setFeatures(#)".}
proc setLoader*(self: VectorTile, loader: JsObject) {.importjs: "#.setLoader(#)".}
