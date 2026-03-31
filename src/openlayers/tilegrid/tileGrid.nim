import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_tilegrid_TileGrid from 'ol/tilegrid/TileGrid.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_tilegrid_TileGrid)".}

type TileGrid* = ref object of JsRoot
proc newTileGrid*(
  options: JsObject
): TileGrid {.importjs: "(new olNs_tilegrid_TileGrid.default(#))".}

proc forEachTileCoord*(
  self: TileGrid, extent: JsObject, zoom: float, callback: JsObject
) {.importjs: "#.forEachTileCoord(#, #, #)".}

proc forEachTileCoordParentTileRange*(
  self: TileGrid,
  tileCoord: JsObject,
  callback: JsObject,
  tempTileRange: JsObject = jsUndefined,
  tempExtent: JsObject = jsUndefined,
): bool {.importjs: "#.forEachTileCoordParentTileRange(#, #, #, #)".}

proc getExtent*(self: TileGrid): JsObject {.importjs: "#.getExtent()".}
proc getMaxZoom*(self: TileGrid): float {.importjs: "#.getMaxZoom()".}
proc getMinZoom*(self: TileGrid): float {.importjs: "#.getMinZoom()".}
proc getOrigin*(self: TileGrid, z: float): JsObject {.importjs: "#.getOrigin(#)".}
proc getOrigins*(self: TileGrid): JsObject {.importjs: "#.getOrigins()".}
proc getResolution*(self: TileGrid, z: float): float {.importjs: "#.getResolution(#)".}
proc getResolutions*(self: TileGrid): seq[float] {.importjs: "#.getResolutions()".}
proc getTileCoordChildTileRange*(
  self: TileGrid,
  tileCoord: JsObject,
  tempTileRange: JsObject = jsUndefined,
  tempExtent: JsObject = jsUndefined,
): JsObject {.importjs: "#.getTileCoordChildTileRange(#, #, #)".}

proc getTileRangeForTileCoordAndZ*(
  self: TileGrid, tileCoord: JsObject, z: float, tempTileRange: JsObject = jsUndefined
): JsObject {.importjs: "#.getTileRangeForTileCoordAndZ(#, #, #)".}

proc getTileRangeForExtentAndZ*(
  self: TileGrid, extent: JsObject, z: float, tempTileRange: JsObject = jsUndefined
): JsObject {.importjs: "#.getTileRangeForExtentAndZ(#, #, #)".}

proc getTileCoordCenter*(
  self: TileGrid, tileCoord: JsObject
): JsObject {.importjs: "#.getTileCoordCenter(#)".}

proc getTileCoordExtent*(
  self: TileGrid, tileCoord: JsObject, tempExtent: JsObject = jsUndefined
): JsObject {.importjs: "#.getTileCoordExtent(#, #)".}

proc getTileCoordForCoordAndResolution*(
  self: TileGrid,
  coordinate: JsObject,
  resolution: float,
  opt_tileCoord: JsObject = jsUndefined,
): JsObject {.importjs: "#.getTileCoordForCoordAndResolution(#, #, #)".}

proc getTileCoordForCoordAndZ*(
  self: TileGrid, coordinate: JsObject, z: float, opt_tileCoord: JsObject = jsUndefined
): JsObject {.importjs: "#.getTileCoordForCoordAndZ(#, #, #)".}

proc getTileCoordResolution*(
  self: TileGrid, tileCoord: JsObject
): float {.importjs: "#.getTileCoordResolution(#)".}

proc getTileSize*(self: TileGrid, z: float): JsObject {.importjs: "#.getTileSize(#)".}
proc getFullTileRange*(
  self: TileGrid, z: float
): JsObject {.importjs: "#.getFullTileRange(#)".}

proc getZForResolution*(
  self: TileGrid, resolution: float, opt_direction: JsObject = jsUndefined
): float {.importjs: "#.getZForResolution(#, #)".}

proc tileCoordIntersectsViewport*(
  self: TileGrid, tileCoord: JsObject, viewport: seq[float]
): bool {.importjs: "#.tileCoordIntersectsViewport(#, #)".}

type TileGridOptions* = ref object of JsRoot

proc newTileGridOptions*(): TileGridOptions {.importjs: "({})".}
proc `extent=`*(options: TileGridOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: TileGridOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `minZoom=`*(options: TileGridOptions, value: float) {.importjs: "#.minZoom = #".}
proc `origin=`*(options: TileGridOptions, value: JsObject) {.importjs: "#.origin = #".}
proc `origin=`*(options: TileGridOptions, value: RootRef) {.importjs: "#.origin = #".}
proc `origins=`*(
  options: TileGridOptions, value: JsObject
) {.importjs: "#.origins = #".}

proc `origins=`*(options: TileGridOptions, value: RootRef) {.importjs: "#.origins = #".}
proc `origins=`*[T](
  options: TileGridOptions, value: seq[T]
) {.importjs: "#.origins = #".}

proc `resolutions=`*(
  options: TileGridOptions, value: seq[float]
) {.importjs: "#.resolutions = #".}

proc `sizes=`*(options: TileGridOptions, value: JsObject) {.importjs: "#.sizes = #".}
proc `sizes=`*(options: TileGridOptions, value: RootRef) {.importjs: "#.sizes = #".}
proc `sizes=`*[T](options: TileGridOptions, value: seq[T]) {.importjs: "#.sizes = #".}
proc `tileSize=`*(options: TileGridOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(
  options: TileGridOptions, value: JsObject
) {.importjs: "#.tileSize = #".}

proc `tileSize=`*(
  options: TileGridOptions, value: RootRef
) {.importjs: "#.tileSize = #".}

proc `tileSizes=`*(
  options: TileGridOptions, value: JsObject
) {.importjs: "#.tileSizes = #".}

proc `tileSizes=`*(
  options: TileGridOptions, value: RootRef
) {.importjs: "#.tileSizes = #".}

proc `tileSizes=`*[T](
  options: TileGridOptions, value: seq[T]
) {.importjs: "#.tileSizes = #".}

proc newTileGrid*(
  options: TileGridOptions
): TileGrid {.importjs: "(new olNs_tilegrid_TileGrid.default(#))".}
