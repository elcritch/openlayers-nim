import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_BaseVector from 'ol/layer/BaseVector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_BaseVector)".}

type
  OlBaseVectorLayer* = ref object of JsRoot
proc newOlBaseVectorLayer*(): OlBaseVectorLayer {.importjs: "(new olNs_layer_BaseVector.default())".}
