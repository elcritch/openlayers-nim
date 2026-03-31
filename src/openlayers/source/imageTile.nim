import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageTile from 'ol/source/ImageTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageTile)".}

type
  ImageTileSource* = ref object of JsRoot
proc newImageTileSource*(options: JsObject = jsUndefined): ImageTileSource {.importjs: "(new olNs_source_ImageTile.default(#))".}
proc setUrl*(self: ImageTileSource, url: JsObject) {.importjs: "#.setUrl(#)".}
