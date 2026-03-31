import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Heatmap from 'ol/layer/Heatmap.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Heatmap)".}

type
  OlHeatmap* = ref object of JsRoot
proc newOlHeatmap*(): OlHeatmap {.importjs: "(new olNs_layer_Heatmap.default())".}
