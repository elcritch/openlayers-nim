import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olVectorRenderTileModule from 'ol/VectorRenderTile.js';".}
{.emit: "import VectorRenderTile from 'ol/VectorRenderTile.js';".}

proc hasVectorRenderTileModule*(): bool {.
  importjs: "(typeof olVectorRenderTileModule !== 'undefined')"
.}

proc hasVectorRenderTileConstructor*(): bool {.
  importjs: "(typeof VectorRenderTile === 'function')"
.}

type OlVectorRenderTile* = ref object of JsRoot

proc newOlVectorRenderTile*(
  tileCoord: JsObject,
  state: JsObject,
  urlTileCoord: JsObject,
  getSourceTiles: JsObject,
  removeSourceTiles: JsObject,
): OlVectorRenderTile {.importjs: "(new VectorRenderTile(#, #, #, #, #))".}
