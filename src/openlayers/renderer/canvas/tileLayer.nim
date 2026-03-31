import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_canvas_TileLayer from 'ol/renderer/canvas/TileLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_TileLayer)".}

type
  CanvasTileLayerRenderer* = ref object of JsRoot
proc newCanvasTileLayerRenderer*(tileLayer: JsObject, options: JsObject = jsUndefined): CanvasTileLayerRenderer {.importjs: "(new olNs_renderer_canvas_TileLayer.default(#, #))".}
proc getTileCache*(self: CanvasTileLayerRenderer): JsObject {.importjs: "#.getTileCache()".}
proc getSourceTileCache*(self: CanvasTileLayerRenderer): JsObject {.importjs: "#.getSourceTileCache()".}
proc getOrCreateTile*(self: CanvasTileLayerRenderer, z: float, x: float, y: float, frameState: JsObject): JsObject {.importjs: "#.getOrCreateTile(#, #, #, #)".}
proc getTile*(self: CanvasTileLayerRenderer, z: float, x: float, y: float, frameState: JsObject): JsObject {.importjs: "#.getTile(#, #, #, #)".}
proc enqueueTilesForNextExtent*(self: CanvasTileLayerRenderer): bool {.importjs: "#.enqueueTilesForNextExtent()".}
proc enqueueTiles*(self: CanvasTileLayerRenderer, frameState: JsObject, extent: JsObject, initialZ: float, tilesByZ: JsObject, preload: float) {.importjs: "#.enqueueTiles(#, #, #, #, #)".}
proc updateCacheSize*(self: CanvasTileLayerRenderer, tileCount: float) {.importjs: "#.updateCacheSize(#)".}
proc drawTile*(self: CanvasTileLayerRenderer, tile: JsObject, frameState: JsObject, x: float, y: float, w: float, h: float, gutter: float, transition: bool) {.importjs: "#.drawTile(#, #, #, #, #, #, #, #)".}
proc getImage*(self: CanvasTileLayerRenderer): JsObject {.importjs: "#.getImage()".}
proc getTileImage*(self: CanvasTileLayerRenderer, tile: JsObject): JsObject {.importjs: "#.getTileImage(#)".}
proc updateUsedTiles*(self: CanvasTileLayerRenderer, usedTiles: JsObject, tileSource: JsObject, tile: JsObject) {.importjs: "#.updateUsedTiles(#, #, #)".}

type
  CanvasTileLayerRendererOptions* = ref object of JsRoot

proc newCanvasTileLayerRendererOptions*(): CanvasTileLayerRendererOptions {.importjs: "({})".}
proc `cacheSize=`*(options: CanvasTileLayerRendererOptions, value: float) {.importjs: "#.cacheSize = #".}

proc newCanvasTileLayerRenderer*(options: CanvasTileLayerRendererOptions): CanvasTileLayerRenderer {.importjs: "(new olNs_renderer_canvas_TileLayer.default(#))".}
