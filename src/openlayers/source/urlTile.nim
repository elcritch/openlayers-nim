import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_UrlTile from 'ol/source/UrlTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_UrlTile)".}

type
  UrlTile* = ref object of JsRoot
proc newUrlTile*(options: JsObject): UrlTile {.importjs: "(new olNs_source_UrlTile.default(#))".}
proc tileUrlFunction*(self: UrlTile, tileCoord: JsObject, pixelRatio: float, projection: JsObject): cstring {.importjs: "#.tileUrlFunction(#, #, #)".}
proc getTileLoadFunction*(self: UrlTile): JsObject {.importjs: "#.getTileLoadFunction()".}
proc getTileUrlFunction*(self: UrlTile): JsObject {.importjs: "#.getTileUrlFunction()".}
proc getUrls*(self: UrlTile): JsObject {.importjs: "#.getUrls()".}
proc handleTileChange*(self: UrlTile, event: JsObject) {.importjs: "#.handleTileChange(#)".}
proc setTileLoadFunction*(self: UrlTile, tileLoadFunction: JsObject) {.importjs: "#.setTileLoadFunction(#)".}
proc setTileUrlFunction*(self: UrlTile, tileUrlFunction: JsObject, key: JsObject = jsUndefined) {.importjs: "#.setTileUrlFunction(#, #)".}
proc setUrl*(self: UrlTile, url: cstring) {.importjs: "#.setUrl(#)".}
proc setUrls*(self: UrlTile, urls: seq[cstring]) {.importjs: "#.setUrls(#)".}
