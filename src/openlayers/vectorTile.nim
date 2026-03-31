import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olVectorTileModule from 'ol/VectorTile.js';".}
{.emit: "import VectorTile from 'ol/VectorTile.js';".}

proc hasVectorTileModule*(): bool {.
  importjs: "(typeof olVectorTileModule !== 'undefined')"
.}

proc hasVectorTileConstructor*(): bool {.
  importjs: "(typeof VectorTile === 'function')"
.}

type OlVectorTile* = ref object of JsRoot

proc newOlVectorTile*(
  tileCoord: JsObject,
  state: JsObject,
  src: cstring,
  format: JsObject,
  tileLoadFunction: JsObject,
  options: JsObject = jsUndefined,
): OlVectorTile {.importjs: "(new VectorTile(#, #, #, #, #, #))".}
