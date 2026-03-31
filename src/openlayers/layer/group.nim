import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Group from 'ol/layer/Group.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Group)".}

type
  LayerGroup* = ref object of JsRoot
proc newLayerGroup*(): LayerGroup {.importjs: "(new olNs_layer_Group.default())".}
