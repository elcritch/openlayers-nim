import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_DataTile from 'ol/source/DataTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_DataTile)".}

type
  DataTileSource* = ref object of JsRoot
proc newDataTileSource*(options: JsObject): DataTileSource {.importjs: "(new olNs_source_DataTile.default(#))".}
proc handleTileChange*(self: DataTileSource, event: JsObject) {.importjs: "#.handleTileChange_(#)".}
proc setTileSizes*(self: DataTileSource, tileSizes: JsObject) {.importjs: "#.setTileSizes(#)".}
proc getTileSize*(self: DataTileSource, z: float): JsObject {.importjs: "#.getTileSize(#)".}
proc setLoader*(self: DataTileSource, loader: JsObject) {.importjs: "#.setLoader(#)".}
proc getReprojTile*(self: DataTileSource, z: float, x: float, y: float, targetProj: JsObject, sourceProj: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getReprojTile_(#, #, #, #, #, #)".}
proc setTileGridForProjection*(self: DataTileSource, projection: JsObject, tilegrid: JsObject) {.importjs: "#.setTileGridForProjection(#, #)".}
