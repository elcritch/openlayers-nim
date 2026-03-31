import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olDataTileModule from 'ol/DataTile.js';".}
when defined(esmModules):
  {.emit: "import DataTile from 'ol/DataTile.js';".}
type OlDataTile* = ref object of JsRoot

proc newOlDataTile*(options: JsObject): OlDataTile {.importjs: "(new DataTile(#))".}

proc asImageLike*(
  data: JsObject
): JsObject {.importjs: "olDataTileModule.asImageLike(#)".}

proc asArrayLike*(
  data: JsObject
): JsObject {.importjs: "olDataTileModule.asArrayLike(#)".}

proc toArray*(image: JsObject): JsObject {.importjs: "olDataTileModule.toArray(#)".}
