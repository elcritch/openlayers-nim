import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageTile from 'ol/source/ImageTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageTile)".}

type
  OlImageTileSource* = ref object of JsRoot
proc newOlImageTileSource*(options: JsObject = jsUndefined): OlImageTileSource {.importjs: "(new olNs_source_ImageTile.default(#))".}
proc setUrl*(self: OlImageTileSource, url: JsObject) {.importjs: "#.setUrl(#)".}
