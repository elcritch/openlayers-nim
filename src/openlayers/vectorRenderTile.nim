import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olVectorRenderTileModule from 'ol/VectorRenderTile.js';".}
when defined(esmModules):
  {.emit: "import VectorRenderTile from 'ol/VectorRenderTile.js';".}
type OlVectorRenderTile* = ref object of JsRoot

proc newOlVectorRenderTile*(
  tileCoord: JsObject,
  state: JsObject,
  urlTileCoord: JsObject,
  getSourceTiles: JsObject,
  removeSourceTiles: JsObject,
): OlVectorRenderTile {.importjs: "(new VectorRenderTile(#, #, #, #, #))".}
