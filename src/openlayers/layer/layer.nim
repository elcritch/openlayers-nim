import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Layer from 'ol/layer/Layer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Layer)".}

type
  OlLayer* = ref object of JsRoot
proc newOlLayer*(): OlLayer {.importjs: "(new olNs_layer_Layer.default())".}

proc inView*(layerState: JsObject, viewState: JsObject): bool {.importjs: "olNs_layer_Layer.inView(#, #)".}
