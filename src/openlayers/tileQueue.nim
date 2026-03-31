import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_TileQueue from 'ol/TileQueue.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_TileQueue)".}

type
  OlTileQueue* = ref object of JsRoot
proc newOlTileQueue*(tilePriorityFunction: JsObject, tileChangeCallback: JsObject): OlTileQueue {.importjs: "(new olNs_TileQueue.default(#, #))".}
proc getTilesLoading*(self: OlTileQueue): float {.importjs: "#.getTilesLoading()".}
proc handleTileChange*(self: OlTileQueue, event: JsObject) {.importjs: "#.handleTileChange(#)".}
proc loadMoreTiles*(self: OlTileQueue, maxTotalLoading: float, maxNewLoads: float) {.importjs: "#.loadMoreTiles(#, #)".}

proc getTilePriority*(frameState: JsObject, tile: JsObject, tileSourceKey: cstring, tileCenter: JsObject, tileResolution: float): float {.importjs: "olNs_TileQueue.getTilePriority(#, #, #, #, #)".}
