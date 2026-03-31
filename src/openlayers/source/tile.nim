import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Tile from 'ol/source/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Tile)".}

type
  OlTileSource* = ref object of JsRoot
proc newOlTileSource*(options: JsObject): OlTileSource {.importjs: "(new olNs_source_Tile.default(#))".}
proc getGutterForProjection*(self: OlTileSource, projection: JsObject): float {.importjs: "#.getGutterForProjection(#)".}
proc getKey*(self: OlTileSource): cstring {.importjs: "#.getKey()".}
proc setKey*(self: OlTileSource, key: cstring) {.importjs: "#.setKey(#)".}
proc getTile*(self: OlTileSource, z: float, x: float, y: float, pixelRatio: float, projection: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getTile(#, #, #, #, #, #)".}
proc getTileGrid*(self: OlTileSource): JsObject {.importjs: "#.getTileGrid()".}
proc getTileGridForProjection*(self: OlTileSource, projection: JsObject): JsObject {.importjs: "#.getTileGridForProjection(#)".}
proc getTilePixelRatio*(self: OlTileSource, pixelRatio: float): float {.importjs: "#.getTilePixelRatio(#)".}
proc getTilePixelSize*(self: OlTileSource, z: float, pixelRatio: float, projection: JsObject): JsObject {.importjs: "#.getTilePixelSize(#, #, #)".}
proc getTileCoordForTileUrlFunction*(self: OlTileSource, tileCoord: JsObject, projection: JsObject = jsUndefined): JsObject {.importjs: "#.getTileCoordForTileUrlFunction(#, #)".}
proc clear*(self: OlTileSource) {.importjs: "#.clear()".}
