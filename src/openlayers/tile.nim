import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olTileModule from 'ol/Tile.js';".}
when defined(esmModules):
  {.emit: "import Tile from 'ol/Tile.js';".}

type OlTile* = ref object of JsRoot

proc newOlTile*(
  tileCoord: JsObject, state: JsObject, options: JsObject = jsUndefined
): OlTile {.importjs: "(new Tile(#, #, #))".}
