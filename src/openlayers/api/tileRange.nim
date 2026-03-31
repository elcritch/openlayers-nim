import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_TileRange from 'ol/TileRange.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_TileRange)".}

type
  OlTileRange* = ref object of JsRoot
proc newOlTileRange*(minX: float, maxX: float, minY: float, maxY: float): OlTileRange {.importjs: "(new olNs_TileRange.default(#, #, #, #))".}
proc contains*(self: OlTileRange, tileCoord: JsObject): bool {.importjs: "#.contains(#)".}
proc containsTileRange*(self: OlTileRange, tileRange: JsObject): bool {.importjs: "#.containsTileRange(#)".}
proc containsXY*(self: OlTileRange, x: float, y: float): bool {.importjs: "#.containsXY(#, #)".}
proc equals*(self: OlTileRange, tileRange: JsObject): bool {.importjs: "#.equals(#)".}
proc extend*(self: OlTileRange, tileRange: JsObject) {.importjs: "#.extend(#)".}
proc getHeight*(self: OlTileRange): float {.importjs: "#.getHeight()".}
proc getSize*(self: OlTileRange): JsObject {.importjs: "#.getSize()".}
proc getWidth*(self: OlTileRange): float {.importjs: "#.getWidth()".}
proc intersects*(self: OlTileRange, tileRange: JsObject): bool {.importjs: "#.intersects(#)".}

proc createOrUpdate*(minX: float, maxX: float, minY: float, maxY: float, tileRange: JsObject = jsUndefined): JsObject {.importjs: "olNs_TileRange.createOrUpdate(#, #, #, #, #)".}
