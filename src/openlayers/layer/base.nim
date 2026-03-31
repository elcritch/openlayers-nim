import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Base from 'ol/layer/Base.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Base)".}

type
  BaseLayer* = ref object of JsRoot
proc newBaseLayer*(): BaseLayer {.importjs: "(new olNs_layer_Base.default())".}
