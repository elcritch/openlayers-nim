import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_WebGLTile from 'ol/layer/WebGLTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_WebGLTile)".}

type
  OlWebGLTileLayer* = ref object of JsRoot
proc newOlWebGLTileLayer*(options: JsObject = jsUndefined): OlWebGLTileLayer {.importjs: "(new olNs_layer_WebGLTile.default(#))".}
proc getSources*(self: OlWebGLTileLayer, extent: JsObject, resolution: float): JsObject {.importjs: "#.getSources(#, #)".}
proc renderSources*(self: OlWebGLTileLayer, frameState: JsObject, sources: JsObject): JsObject {.importjs: "#.renderSources(#, #)".}
proc setStyle*(self: OlWebGLTileLayer, style: JsObject) {.importjs: "#.setStyle(#)".}
proc updateStyleVariables*(self: OlWebGLTileLayer, variables: JsObject) {.importjs: "#.updateStyleVariables(#)".}
