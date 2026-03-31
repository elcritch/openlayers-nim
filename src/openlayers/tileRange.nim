import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olTileRangeModule from 'ol/TileRange.js';".}
when defined(esmModules):
  {.emit: "import TileRange from 'ol/TileRange.js';".}
type OlTileRange* = ref object of JsRoot

proc newOlTileRange*(
  minX: float, maxX: float, minY: float, maxY: float
): OlTileRange {.importjs: "(new TileRange(#, #, #, #))".}

proc createOrUpdate*(
  minX: float, maxX: float, minY: float, maxY: float, tileRange: JsObject = jsUndefined
): JsObject {.importjs: "olTileRangeModule.createOrUpdate(#, #, #, #, #)".}
