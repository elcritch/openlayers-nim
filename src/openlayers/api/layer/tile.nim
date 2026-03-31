import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Tile from 'ol/layer/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Tile)".}

type
  OlTileLayer* = ref object of JsRoot
proc newOlTileLayer*(options: JsObject = jsUndefined): OlTileLayer {.importjs: "(new olNs_layer_Tile.default(#))".}
