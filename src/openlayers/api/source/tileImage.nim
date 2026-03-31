import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileImage from 'ol/source/TileImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileImage)".}

type
  OlTileImage* = ref object of JsRoot
proc newOlTileImage*(options: JsObject): OlTileImage {.importjs: "(new olNs_source_TileImage.default(#))".}
proc getGutter*(self: OlTileImage): float {.importjs: "#.getGutter()".}
proc getTileInternal*(self: OlTileImage, z: float, x: float, y: float, pixelRatio: float, projection: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getTileInternal(#, #, #, #, #, #)".}
proc setRenderReprojectionEdges*(self: OlTileImage, render: bool) {.importjs: "#.setRenderReprojectionEdges(#)".}
proc setTileGridForProjection*(self: OlTileImage, projection: JsObject, tilegrid: JsObject) {.importjs: "#.setTileGridForProjection(#, #)".}

proc defaultTileLoadFunction*(imageTile: JsObject, src: cstring) {.importjs: "olNs_source_TileImage.defaultTileLoadFunction(#, #)".}
