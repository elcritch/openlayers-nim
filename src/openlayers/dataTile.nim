import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olDataTileModule from 'ol/DataTile.js';".}
{.emit: "import DataTile from 'ol/DataTile.js';".}

proc hasDataTileModule*(): bool {.
  importjs: "(typeof olDataTileModule !== 'undefined')"
.}

proc hasDataTileConstructor*(): bool {.importjs: "(typeof DataTile === 'function')".}

type OlDataTile* = ref object of JsRoot

proc newOlDataTile*(options: JsObject): OlDataTile {.importjs: "(new DataTile(#))".}

proc asImageLike*(
  data: JsObject
): JsObject {.importjs: "olDataTileModule.asImageLike(#)".}

proc asArrayLike*(
  data: JsObject
): JsObject {.importjs: "olDataTileModule.asArrayLike(#)".}

proc toArray*(image: JsObject): JsObject {.importjs: "olDataTileModule.toArray(#)".}
