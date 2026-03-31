import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olImageTileModule from 'ol/ImageTile.js';".}
{.emit: "import ImageTile from 'ol/ImageTile.js';".}

proc hasImageTileModule*(): bool {.
  importjs: "(typeof olImageTileModule !== 'undefined')"
.}

proc hasImageTileConstructor*(): bool {.importjs: "(typeof ImageTile === 'function')".}

type OlImageTile* = ref object of JsRoot

proc newOlImageTile*(
  tileCoord: JsObject,
  state: JsObject,
  src: cstring,
  imageAttributes: JsObject,
  tileLoadFunction: JsObject,
  options: JsObject = jsUndefined,
): OlImageTile {.importjs: "(new ImageTile(#, #, #, #, #, #))".}
