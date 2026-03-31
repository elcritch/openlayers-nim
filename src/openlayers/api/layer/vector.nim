import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Vector from 'ol/layer/Vector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Vector)".}

type
  OlVectorLayer* = ref object of JsRoot
proc newOlVectorLayer*(options: JsObject = jsUndefined): OlVectorLayer {.importjs: "(new olNs_layer_Vector.default(#))".}
