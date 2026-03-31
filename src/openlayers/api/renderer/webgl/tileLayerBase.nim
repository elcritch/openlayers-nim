import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_TileLayerBase from 'ol/renderer/webgl/TileLayerBase.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_TileLayerBase)".}

type
  OlWebGLBaseTileLayerRenderer* = ref object of JsRoot
proc newOlWebGLBaseTileLayerRenderer*(tileLayer: JsObject, options: JsObject): OlWebGLBaseTileLayerRenderer {.importjs: "(new olNs_renderer_webgl_TileLayerBase.default(#, #))".}
proc createTileRepresentation*(self: OlWebGLBaseTileLayerRenderer, options: JsObject): JsObject {.importjs: "#.createTileRepresentation(#)".}
proc enqueueTiles*(self: OlWebGLBaseTileLayerRenderer, frameState: JsObject, extent: JsObject, initialZ: float, tileRepresentationLookup: JsObject, preload: float) {.importjs: "#.enqueueTiles(#, #, #, #, #)".}
proc beforeTilesRender*(self: OlWebGLBaseTileLayerRenderer, frameState: JsObject, tilesWithAlpha: bool) {.importjs: "#.beforeTilesRender(#, #)".}
proc beforeTilesMaskRender*(self: OlWebGLBaseTileLayerRenderer, frameState: JsObject): bool {.importjs: "#.beforeTilesMaskRender(#)".}
proc renderTile*(self: OlWebGLBaseTileLayerRenderer, tileRepresentation: JsObject, tileTransform: JsObject, frameState: JsObject, renderExtent: JsObject, tileResolution: float, tileSize: JsObject, tileOrigin: JsObject, tileExtent: JsObject, depth: float, gutter: float, alpha: float) {.importjs: "#.renderTile(#, #, #, #, #, #, #, #, #, #, #)".}
proc renderTileMask*(self: OlWebGLBaseTileLayerRenderer, tileRepresentation: JsObject, tileZ: float, extent: JsObject, depth: float) {.importjs: "#.renderTileMask(#, #, #, #)".}
proc drawTile*(self: OlWebGLBaseTileLayerRenderer, frameState: JsObject, tileRepresentation: JsObject, tileZ: JsObject, gutter: JsObject, extent: JsObject, alphaLookup: JsObject, tileGrid: JsObject) {.importjs: "#.drawTile_(#, #, #, #, #, #, #)".}
proc beforeFinalize*(self: OlWebGLBaseTileLayerRenderer, frameState: JsObject) {.importjs: "#.beforeFinalize(#)".}

proc newTileRepresentationLookup*(): JsObject {.importjs: "olNs_renderer_webgl_TileLayerBase.newTileRepresentationLookup()".}
proc getCacheKey*(source: JsObject, tileCoord: JsObject): cstring {.importjs: "olNs_renderer_webgl_TileLayerBase.getCacheKey(#, #)".}
