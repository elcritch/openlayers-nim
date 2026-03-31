import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_ImageTile from 'ol/ImageTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_ImageTile)".}

type
  OlImageTile* = ref object of JsRoot
proc newOlImageTile*(tileCoord: JsObject, state: JsObject, src: cstring, imageAttributes: JsObject, tileLoadFunction: JsObject, options: JsObject = jsUndefined): OlImageTile {.importjs: "(new olNs_ImageTile.default(#, #, #, #, #, #))".}
proc getImage*(self: OlImageTile): JsObject {.importjs: "#.getImage()".}
proc setImage*(self: OlImageTile, element: JsObject) {.importjs: "#.setImage(#)".}
proc getCrossOrigin*(self: OlImageTile): cstring {.importjs: "#.getCrossOrigin()".}
proc getReferrerPolicy*(self: OlImageTile): JsObject {.importjs: "#.getReferrerPolicy()".}
