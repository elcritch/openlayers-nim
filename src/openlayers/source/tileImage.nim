import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileImage from 'ol/source/TileImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileImage)".}

type
  TileImage* = ref object of JsRoot
proc newTileImage*(options: JsObject): TileImage {.importjs: "(new olNs_source_TileImage.default(#))".}
proc getGutter*(self: TileImage): float {.importjs: "#.getGutter()".}
proc getTileInternal*(self: TileImage, z: float, x: float, y: float, pixelRatio: float, projection: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getTileInternal(#, #, #, #, #, #)".}
proc setRenderReprojectionEdges*(self: TileImage, render: bool) {.importjs: "#.setRenderReprojectionEdges(#)".}
proc setTileGridForProjection*(self: TileImage, projection: JsObject, tilegrid: JsObject) {.importjs: "#.setTileGridForProjection(#, #)".}

proc defaultTileLoadFunction*(imageTile: JsObject, src: cstring) {.importjs: "olNs_source_TileImage.defaultTileLoadFunction(#, #)".}
