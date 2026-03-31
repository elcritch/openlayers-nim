import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_tilegrid_TileGrid from 'ol/tilegrid/TileGrid.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_tilegrid_TileGrid)".}

type
  OlTileGrid* = ref object of JsRoot
proc newOlTileGrid*(options: JsObject): OlTileGrid {.importjs: "(new olNs_tilegrid_TileGrid.default(#))".}
proc forEachTileCoord*(self: OlTileGrid, extent: JsObject, zoom: float, callback: JsObject) {.importjs: "#.forEachTileCoord(#, #, #)".}
proc forEachTileCoordParentTileRange*(self: OlTileGrid, tileCoord: JsObject, callback: JsObject, tempTileRange: JsObject = jsUndefined, tempExtent: JsObject = jsUndefined): bool {.importjs: "#.forEachTileCoordParentTileRange(#, #, #, #)".}
proc getExtent*(self: OlTileGrid): JsObject {.importjs: "#.getExtent()".}
proc getMaxZoom*(self: OlTileGrid): float {.importjs: "#.getMaxZoom()".}
proc getMinZoom*(self: OlTileGrid): float {.importjs: "#.getMinZoom()".}
proc getOrigin*(self: OlTileGrid, z: float): JsObject {.importjs: "#.getOrigin(#)".}
proc getOrigins*(self: OlTileGrid): JsObject {.importjs: "#.getOrigins()".}
proc getResolution*(self: OlTileGrid, z: float): float {.importjs: "#.getResolution(#)".}
proc getResolutions*(self: OlTileGrid): seq[float] {.importjs: "#.getResolutions()".}
proc getTileCoordChildTileRange*(self: OlTileGrid, tileCoord: JsObject, tempTileRange: JsObject = jsUndefined, tempExtent: JsObject = jsUndefined): JsObject {.importjs: "#.getTileCoordChildTileRange(#, #, #)".}
proc getTileRangeForTileCoordAndZ*(self: OlTileGrid, tileCoord: JsObject, z: float, tempTileRange: JsObject = jsUndefined): JsObject {.importjs: "#.getTileRangeForTileCoordAndZ(#, #, #)".}
proc getTileRangeForExtentAndZ*(self: OlTileGrid, extent: JsObject, z: float, tempTileRange: JsObject = jsUndefined): JsObject {.importjs: "#.getTileRangeForExtentAndZ(#, #, #)".}
proc getTileCoordCenter*(self: OlTileGrid, tileCoord: JsObject): JsObject {.importjs: "#.getTileCoordCenter(#)".}
proc getTileCoordExtent*(self: OlTileGrid, tileCoord: JsObject, tempExtent: JsObject = jsUndefined): JsObject {.importjs: "#.getTileCoordExtent(#, #)".}
proc getTileCoordForCoordAndResolution*(self: OlTileGrid, coordinate: JsObject, resolution: float, opt_tileCoord: JsObject = jsUndefined): JsObject {.importjs: "#.getTileCoordForCoordAndResolution(#, #, #)".}
proc getTileCoordForCoordAndZ*(self: OlTileGrid, coordinate: JsObject, z: float, opt_tileCoord: JsObject = jsUndefined): JsObject {.importjs: "#.getTileCoordForCoordAndZ(#, #, #)".}
proc getTileCoordResolution*(self: OlTileGrid, tileCoord: JsObject): float {.importjs: "#.getTileCoordResolution(#)".}
proc getTileSize*(self: OlTileGrid, z: float): JsObject {.importjs: "#.getTileSize(#)".}
proc getFullTileRange*(self: OlTileGrid, z: float): JsObject {.importjs: "#.getFullTileRange(#)".}
proc getZForResolution*(self: OlTileGrid, resolution: float, opt_direction: JsObject = jsUndefined): float {.importjs: "#.getZForResolution(#, #)".}
proc tileCoordIntersectsViewport*(self: OlTileGrid, tileCoord: JsObject, viewport: seq[float]): bool {.importjs: "#.tileCoordIntersectsViewport(#, #)".}
