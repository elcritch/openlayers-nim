import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_WebGLPoints from 'ol/layer/WebGLPoints.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_WebGLPoints)".}

type
  OlWebGLPointsLayer* = ref object of JsRoot
proc newOlWebGLPointsLayer*(): OlWebGLPointsLayer {.importjs: "(new olNs_layer_WebGLPoints.default())".}
