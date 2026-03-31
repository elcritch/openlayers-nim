import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_BaseTile from 'ol/layer/BaseTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_BaseTile)".}

type
  BaseTileLayer* = ref object of JsRoot
proc newBaseTileLayer*(): BaseTileLayer {.importjs: "(new olNs_layer_BaseTile.default())".}
