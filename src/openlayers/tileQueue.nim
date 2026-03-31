import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olTileQueueModule from 'ol/TileQueue.js';".}
{.emit: "import TileQueue from 'ol/TileQueue.js';".}

proc hasTileQueueModule*(): bool {.
  importjs: "(typeof olTileQueueModule !== 'undefined')"
.}

proc hasTileQueueConstructor*(): bool {.importjs: "(typeof TileQueue === 'function')".}

type OlTileQueue* = ref object of JsRoot

proc newOlTileQueue*(
  tilePriorityFunction: JsObject, tileChangeCallback: JsObject
): OlTileQueue {.importjs: "(new TileQueue(#, #))".}

proc getTilePriority*(
  frameState: JsObject,
  tile: JsObject,
  tileSourceKey: cstring,
  tileCenter: JsObject,
  tileResolution: float,
): float {.importjs: "olTileQueueModule.getTilePriority(#, #, #, #, #)".}
