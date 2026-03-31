import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_VectorImage from 'ol/layer/VectorImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_VectorImage)".}

type
  VectorImageLayer* = ref object of JsRoot
proc newVectorImageLayer*(options: JsObject = jsUndefined): VectorImageLayer {.importjs: "(new olNs_layer_VectorImage.default(#))".}
proc getImageRatio*(self: VectorImageLayer): float {.importjs: "#.getImageRatio()".}
