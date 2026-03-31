import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_canvas_TileLayer from 'ol/renderer/canvas/TileLayer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_canvas_TileLayer)".}

type
  OlCanvasTileLayerRenderer* = ref object of JsRoot
proc newOlCanvasTileLayerRenderer*(tileLayer: JsObject, options: JsObject = jsUndefined): OlCanvasTileLayerRenderer {.importjs: "(new olNs_renderer_canvas_TileLayer.default(#, #))".}
proc getTileCache*(self: OlCanvasTileLayerRenderer): JsObject {.importjs: "#.getTileCache()".}
proc getSourceTileCache*(self: OlCanvasTileLayerRenderer): JsObject {.importjs: "#.getSourceTileCache()".}
proc getOrCreateTile*(self: OlCanvasTileLayerRenderer, z: float, x: float, y: float, frameState: JsObject): JsObject {.importjs: "#.getOrCreateTile(#, #, #, #)".}
proc getTile*(self: OlCanvasTileLayerRenderer, z: float, x: float, y: float, frameState: JsObject): JsObject {.importjs: "#.getTile(#, #, #, #)".}
proc enqueueTilesForNextExtent*(self: OlCanvasTileLayerRenderer): bool {.importjs: "#.enqueueTilesForNextExtent()".}
proc enqueueTiles*(self: OlCanvasTileLayerRenderer, frameState: JsObject, extent: JsObject, initialZ: float, tilesByZ: JsObject, preload: float) {.importjs: "#.enqueueTiles(#, #, #, #, #)".}
proc updateCacheSize*(self: OlCanvasTileLayerRenderer, tileCount: float) {.importjs: "#.updateCacheSize(#)".}
proc drawTile*(self: OlCanvasTileLayerRenderer, tile: JsObject, frameState: JsObject, x: float, y: float, w: float, h: float, gutter: float, transition: bool) {.importjs: "#.drawTile(#, #, #, #, #, #, #, #)".}
proc getImage*(self: OlCanvasTileLayerRenderer): JsObject {.importjs: "#.getImage()".}
proc getTileImage*(self: OlCanvasTileLayerRenderer, tile: JsObject): JsObject {.importjs: "#.getTileImage(#)".}
proc updateUsedTiles*(self: OlCanvasTileLayerRenderer, usedTiles: JsObject, tileSource: JsObject, tile: JsObject) {.importjs: "#.updateUsedTiles(#, #, #)".}
