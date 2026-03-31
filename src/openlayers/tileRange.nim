import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olTileRangeModule from 'ol/TileRange.js';".}
{.emit: "import TileRange from 'ol/TileRange.js';".}

proc hasTileRangeModule*(): bool {.
  importjs: "(typeof olTileRangeModule !== 'undefined')"
.}

proc hasTileRangeConstructor*(): bool {.importjs: "(typeof TileRange === 'function')".}

type OlTileRange* = ref object of JsRoot

proc newOlTileRange*(
  minX: float, maxX: float, minY: float, maxY: float
): OlTileRange {.importjs: "(new TileRange(#, #, #, #))".}

proc createOrUpdate*(
  minX: float, maxX: float, minY: float, maxY: float, tileRange: JsObject = jsUndefined
): JsObject {.importjs: "olTileRangeModule.createOrUpdate(#, #, #, #, #)".}
