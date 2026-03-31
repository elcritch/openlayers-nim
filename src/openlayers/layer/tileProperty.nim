import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_TileProperty from 'ol/layer/TileProperty.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_TileProperty)".}
