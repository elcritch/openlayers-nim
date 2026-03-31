import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_VectorTile from 'ol/source/VectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_VectorTile)".}

type
  VectorTile* = ref object of JsRoot
proc newVectorTile*(options: JsObject): VectorTile {.importjs: "(new olNs_source_VectorTile.default(#))".}
proc getOverlaps*(self: VectorTile): bool {.importjs: "#.getOverlaps()".}
proc getSourceTiles*(self: VectorTile, pixelRatio: float, projection: JsObject, tile: JsObject): JsObject {.importjs: "#.getSourceTiles(#, #, #)".}
proc removeSourceTiles*(self: VectorTile, tile: JsObject) {.importjs: "#.removeSourceTiles(#)".}
proc setOverlaps*(self: VectorTile, overlaps: bool) {.importjs: "#.setOverlaps(#)".}

proc defaultLoadFunction*(tile: JsObject, url: cstring) {.importjs: "olNs_source_VectorTile.defaultLoadFunction(#, #)".}

type
  VectorTileOptions* = ref object of JsRoot

proc newVectorTileOptions*(): VectorTileOptions {.importjs: "({})".}
proc `attributions=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: VectorTileOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: VectorTileOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `attributionsCollapsible=`*(options: VectorTileOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `cacheSize=`*(options: VectorTileOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `extent=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `format=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.format = #".}
proc `format=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.format = #".}
proc `overlaps=`*(options: VectorTileOptions, value: bool) {.importjs: "#.overlaps = #".}
proc `projection=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `state=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.state = #".}
proc `tileClass=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.tileClass = #".}
proc `tileClass=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.tileClass = #".}
proc `maxZoom=`*(options: VectorTileOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: VectorTileOptions, value: float) {.importjs: "#.minZoom = #".}
proc `tileSize=`*(options: VectorTileOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.tileSize = #".}
proc `maxResolution=`*(options: VectorTileOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `tileGrid=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `tileLoadFunction=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.tileLoadFunction = #".}
proc `tileLoadFunction=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.tileLoadFunction = #".}
proc `tileUrlFunction=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.tileUrlFunction = #".}
proc `tileUrlFunction=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.tileUrlFunction = #".}
proc `url=`*(options: VectorTileOptions, value: cstring) {.importjs: "#.url = #".}
proc `transition=`*(options: VectorTileOptions, value: float) {.importjs: "#.transition = #".}
proc `urls=`*(options: VectorTileOptions, value: seq[cstring]) {.importjs: "#.urls = #".}
proc `wrapX=`*(options: VectorTileOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `zDirection=`*(options: VectorTileOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: VectorTileOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: VectorTileOptions, value: RootRef) {.importjs: "#.zDirection = #".}

proc newVectorTile*(options: VectorTileOptions): VectorTile {.importjs: "(new olNs_source_VectorTile.default(#))".}
