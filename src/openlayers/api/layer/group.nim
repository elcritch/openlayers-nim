import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Group from 'ol/layer/Group.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Group)".}

type
  OlLayerGroup* = ref object of JsRoot
proc newOlLayerGroup*(): OlLayerGroup {.importjs: "(new olNs_layer_Group.default())".}
