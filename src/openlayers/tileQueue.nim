import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olTileQueueModule from 'ol/TileQueue.js';".}
when defined(esmModules):
  {.emit: "import TileQueue from 'ol/TileQueue.js';".}
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
