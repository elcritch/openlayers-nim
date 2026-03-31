import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Flow from 'ol/layer/Flow.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Flow)".}

type
  OlFlowLayer* = ref object of JsRoot
proc newOlFlowLayer*(options: JsObject): OlFlowLayer {.importjs: "(new olNs_layer_Flow.default(#))".}
proc updateStyleVariables*(self: OlFlowLayer, variables: JsObject) {.importjs: "#.updateStyleVariables(#)".}
proc getSources*(self: OlFlowLayer, extent: JsObject, resolution: float): JsObject {.importjs: "#.getSources(#, #)".}
