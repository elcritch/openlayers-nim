import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_ImageTile from 'ol/ImageTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_ImageTile)".}

type ImageTile* = ref object of JsRoot
proc newImageTile*(
  tileCoord: JsObject,
  state: JsObject,
  src: cstring,
  imageAttributes: JsObject,
  tileLoadFunction: JsObject,
  options: JsObject = jsUndefined,
): ImageTile {.importjs: "(new olNs_ImageTile.default(#, #, #, #, #, #))".}

proc getImage*(self: ImageTile): JsObject {.importjs: "#.getImage()".}
proc setImage*(self: ImageTile, element: JsObject) {.importjs: "#.setImage(#)".}
proc getCrossOrigin*(self: ImageTile): cstring {.importjs: "#.getCrossOrigin()".}
proc getReferrerPolicy*(self: ImageTile): JsObject {.importjs: "#.getReferrerPolicy()".}
