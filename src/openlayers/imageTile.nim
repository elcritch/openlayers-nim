import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olImageTileModule from 'ol/ImageTile.js';".}
when defined(esmModules):
  {.emit: "import ImageTile from 'ol/ImageTile.js';".}
type OlImageTile* = ref object of JsRoot

proc newOlImageTile*(
  tileCoord: JsObject,
  state: JsObject,
  src: cstring,
  imageAttributes: JsObject,
  tileLoadFunction: JsObject,
  options: JsObject = jsUndefined,
): OlImageTile {.importjs: "(new ImageTile(#, #, #, #, #, #))".}
