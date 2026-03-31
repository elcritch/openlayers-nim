import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_UrlTile from 'ol/source/UrlTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_UrlTile)".}

type
  OlUrlTile* = ref object of JsRoot
proc newOlUrlTile*(options: JsObject): OlUrlTile {.importjs: "(new olNs_source_UrlTile.default(#))".}
proc tileUrlFunction*(self: OlUrlTile, tileCoord: JsObject, pixelRatio: float, projection: JsObject): cstring {.importjs: "#.tileUrlFunction(#, #, #)".}
proc getTileLoadFunction*(self: OlUrlTile): JsObject {.importjs: "#.getTileLoadFunction()".}
proc getTileUrlFunction*(self: OlUrlTile): JsObject {.importjs: "#.getTileUrlFunction()".}
proc getUrls*(self: OlUrlTile): JsObject {.importjs: "#.getUrls()".}
proc handleTileChange*(self: OlUrlTile, event: JsObject) {.importjs: "#.handleTileChange(#)".}
proc setTileLoadFunction*(self: OlUrlTile, tileLoadFunction: JsObject) {.importjs: "#.setTileLoadFunction(#)".}
proc setTileUrlFunction*(self: OlUrlTile, tileUrlFunction: JsObject, key: JsObject = jsUndefined) {.importjs: "#.setTileUrlFunction(#, #)".}
proc setUrl*(self: OlUrlTile, url: cstring) {.importjs: "#.setUrl(#)".}
proc setUrls*(self: OlUrlTile, urls: seq[cstring]) {.importjs: "#.setUrls(#)".}
