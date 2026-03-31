import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_VectorImage from 'ol/layer/VectorImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_VectorImage)".}

type
  OlVectorImageLayer* = ref object of JsRoot
proc newOlVectorImageLayer*(options: JsObject = jsUndefined): OlVectorImageLayer {.importjs: "(new olNs_layer_VectorImage.default(#))".}
proc getImageRatio*(self: OlVectorImageLayer): float {.importjs: "#.getImageRatio()".}
