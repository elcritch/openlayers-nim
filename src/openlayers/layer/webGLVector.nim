import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_WebGLVector from 'ol/layer/WebGLVector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_WebGLVector)".}

type
  OlWebGLVectorLayer* = ref object of JsRoot
proc newOlWebGLVectorLayer*(): OlWebGLVectorLayer {.importjs: "(new olNs_layer_WebGLVector.default())".}
