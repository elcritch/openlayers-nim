import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_VectorTile from 'ol/VectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_VectorTile)".}

type
  OlVectorTile* = ref object of JsRoot
proc newOlVectorTile*(tileCoord: JsObject, state: JsObject, src: cstring, format: JsObject, tileLoadFunction: JsObject, options: JsObject = jsUndefined): OlVectorTile {.importjs: "(new olNs_VectorTile.default(#, #, #, #, #, #))".}
proc getTileUrl*(self: OlVectorTile): cstring {.importjs: "#.getTileUrl()".}
proc getFormat*(self: OlVectorTile): JsObject {.importjs: "#.getFormat()".}
proc getFeatures*(self: OlVectorTile): JsObject {.importjs: "#.getFeatures()".}
proc onLoad*(self: OlVectorTile, features: JsObject, dataProjection: JsObject) {.importjs: "#.onLoad(#, #)".}
proc onError*(self: OlVectorTile) {.importjs: "#.onError()".}
proc setFeatures*(self: OlVectorTile, features: JsObject) {.importjs: "#.setFeatures(#)".}
proc setLoader*(self: OlVectorTile, loader: JsObject) {.importjs: "#.setLoader(#)".}
