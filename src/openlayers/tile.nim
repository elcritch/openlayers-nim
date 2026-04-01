import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_Tile from 'ol/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Tile)".}

type
  Tile* = ref object of JsRoot
proc newTile*(tileCoord: JsObject, state: JsObject, options: JsObject = jsUndefined): Tile {.importjs: "(new olNs_Tile.default(#, #, #))".}
proc changed*(self: Tile) {.importjs: "#.changed()".}
proc release*(self: Tile) {.importjs: "#.release()".}
proc getKey*(self: Tile): cstring {.importjs: "#.getKey()".}
proc getTileCoord*(self: Tile): JsObject {.importjs: "#.getTileCoord()".}
proc getState*(self: Tile): JsObject {.importjs: "#.getState()".}
proc setState*(self: Tile, state: JsObject) {.importjs: "#.setState(#)".}
proc load*(self: Tile) {.importjs: "#.load()".}
proc getAlpha*(self: Tile, id: cstring, time: float): float {.importjs: "#.getAlpha(#, #)".}
proc inTransition*(self: Tile, id: cstring): bool {.importjs: "#.inTransition(#)".}
proc endTransition*(self: Tile, id: cstring) {.importjs: "#.endTransition(#)".}

type
  TileOptions* = ref object of JsRoot

proc newTileOptions*(): TileOptions {.importjs: "({})".}
proc `transition=`*(options: TileOptions, value: float) {.importjs: "#.transition = #".}
proc `interpolate=`*(options: TileOptions, value: bool) {.importjs: "#.interpolate = #".}

proc newTile*(options: TileOptions): Tile {.importjs: "(new olNs_Tile.default(#))".}
