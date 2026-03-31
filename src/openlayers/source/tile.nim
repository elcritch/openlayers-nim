import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Tile from 'ol/source/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Tile)".}

type
  TileSource* = ref object of JsRoot
proc newTileSource*(options: JsObject): TileSource {.importjs: "(new olNs_source_Tile.default(#))".}
proc getGutterForProjection*(self: TileSource, projection: JsObject): float {.importjs: "#.getGutterForProjection(#)".}
proc getKey*(self: TileSource): cstring {.importjs: "#.getKey()".}
proc setKey*(self: TileSource, key: cstring) {.importjs: "#.setKey(#)".}
proc getTile*(self: TileSource, z: float, x: float, y: float, pixelRatio: float, projection: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getTile(#, #, #, #, #, #)".}
proc getTileGrid*(self: TileSource): JsObject {.importjs: "#.getTileGrid()".}
proc getTileGridForProjection*(self: TileSource, projection: JsObject): JsObject {.importjs: "#.getTileGridForProjection(#)".}
proc getTilePixelRatio*(self: TileSource, pixelRatio: float): float {.importjs: "#.getTilePixelRatio(#)".}
proc getTilePixelSize*(self: TileSource, z: float, pixelRatio: float, projection: JsObject): JsObject {.importjs: "#.getTilePixelSize(#, #, #)".}
proc getTileCoordForTileUrlFunction*(self: TileSource, tileCoord: JsObject, projection: JsObject = jsUndefined): JsObject {.importjs: "#.getTileCoordForTileUrlFunction(#, #)".}
proc clear*(self: TileSource) {.importjs: "#.clear()".}
