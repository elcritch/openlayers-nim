import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olTileModule from 'ol/Tile.js';".}
{.emit: "import Tile from 'ol/Tile.js';".}

proc hasTileModule*(): bool {.importjs: "(typeof olTileModule !== 'undefined')".}
proc hasTileConstructor*(): bool {.importjs: "(typeof Tile === 'function')".}

type OlTile* = ref object of JsRoot

proc newOlTile*(
  tileCoord: JsObject, state: JsObject, options: JsObject = jsUndefined
): OlTile {.importjs: "(new Tile(#, #, #))".}
