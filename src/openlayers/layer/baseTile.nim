import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_BaseTile from 'ol/layer/BaseTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_BaseTile)".}

type
  OlBaseTileLayer* = ref object of JsRoot
proc newOlBaseTileLayer*(): OlBaseTileLayer {.importjs: "(new olNs_layer_BaseTile.default())".}
