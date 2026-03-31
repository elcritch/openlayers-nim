import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_DataTile from 'ol/source/DataTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_DataTile)".}

type
  OlDataTileSource* = ref object of JsRoot
proc newOlDataTileSource*(options: JsObject): OlDataTileSource {.importjs: "(new olNs_source_DataTile.default(#))".}
proc handleTileChange*(self: OlDataTileSource, event: JsObject) {.importjs: "#.handleTileChange_(#)".}
proc setTileSizes*(self: OlDataTileSource, tileSizes: JsObject) {.importjs: "#.setTileSizes(#)".}
proc getTileSize*(self: OlDataTileSource, z: float): JsObject {.importjs: "#.getTileSize(#)".}
proc setLoader*(self: OlDataTileSource, loader: JsObject) {.importjs: "#.setLoader(#)".}
proc getReprojTile*(self: OlDataTileSource, z: float, x: float, y: float, targetProj: JsObject, sourceProj: JsObject, tileCache: JsObject = jsUndefined): JsObject {.importjs: "#.getReprojTile_(#, #, #, #, #, #)".}
proc setTileGridForProjection*(self: OlDataTileSource, projection: JsObject, tilegrid: JsObject) {.importjs: "#.setTileGridForProjection(#, #)".}
