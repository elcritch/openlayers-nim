import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_reproj_Tile from 'ol/reproj/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_reproj_Tile)".}

type
  OlReprojTile* = ref object of JsRoot
proc newOlReprojTile*(sourceProj: JsObject, sourceTileGrid: JsObject, targetProj: JsObject, targetTileGrid: JsObject, tileCoord: JsObject, wrappedTileCoord: JsObject, pixelRatio: float, gutter: float, getTileFunction: JsObject, errorThreshold: JsObject = jsUndefined, renderEdges: JsObject = jsUndefined, options: JsObject = jsUndefined): OlReprojTile {.importjs: "(new olNs_reproj_Tile.default(#, #, #, #, #, #, #, #, #, #, #, #))".}
proc getImage*(self: OlReprojTile): JsObject {.importjs: "#.getImage()".}
