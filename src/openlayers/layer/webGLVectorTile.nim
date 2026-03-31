import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_WebGLVectorTile from 'ol/layer/WebGLVectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_WebGLVectorTile)".}

type
  OlWebGLVectorTileLayer* = ref object of JsRoot
proc newOlWebGLVectorTileLayer*(options: JsObject = jsUndefined): OlWebGLVectorTileLayer {.importjs: "(new olNs_layer_WebGLVectorTile.default(#))".}
proc updateStyleVariables*(self: OlWebGLVectorTileLayer, variables: JsObject) {.importjs: "#.updateStyleVariables(#)".}
proc setStyle*(self: OlWebGLVectorTileLayer, style: JsObject) {.importjs: "#.setStyle(#)".}
