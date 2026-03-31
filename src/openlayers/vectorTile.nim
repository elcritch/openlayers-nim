import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olVectorTileModule from 'ol/VectorTile.js';".}
when defined(esmModules):
  {.emit: "import VectorTile from 'ol/VectorTile.js';".}
type OlVectorTile* = ref object of JsRoot

proc newOlVectorTile*(
  tileCoord: JsObject,
  state: JsObject,
  src: cstring,
  format: JsObject,
  tileLoadFunction: JsObject,
  options: JsObject = jsUndefined,
): OlVectorTile {.importjs: "(new VectorTile(#, #, #, #, #, #))".}
