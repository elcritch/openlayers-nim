import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_WebGLTile from 'ol/layer/WebGLTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_WebGLTile)".}

type
  WebGLTileLayer* = ref object of JsRoot
proc newWebGLTileLayer*(options: JsObject = jsUndefined): WebGLTileLayer {.importjs: "(new olNs_layer_WebGLTile.default(#))".}
proc getSources*(self: WebGLTileLayer, extent: JsObject, resolution: float): JsObject {.importjs: "#.getSources(#, #)".}
proc renderSources*(self: WebGLTileLayer, frameState: JsObject, sources: JsObject): JsObject {.importjs: "#.renderSources(#, #)".}
proc setStyle*(self: WebGLTileLayer, style: JsObject) {.importjs: "#.setStyle(#)".}
proc updateStyleVariables*(self: WebGLTileLayer, variables: JsObject) {.importjs: "#.updateStyleVariables(#)".}
