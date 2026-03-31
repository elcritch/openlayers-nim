import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Tile from 'ol/layer/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Tile)".}

type
  TileLayer* = ref object of JsRoot
proc newTileLayer*(options: JsObject = jsUndefined): TileLayer {.importjs: "(new olNs_layer_Tile.default(#))".}
