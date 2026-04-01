import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_tilegrid from 'ol/tilegrid.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_tilegrid)".}

proc getForProjection*(projection: JsObject): JsObject {.importjs: "olNs_tilegrid.getForProjection(#)".}
proc wrapX*(tileGrid: JsObject, tileCoord: JsObject, projection: JsObject): JsObject {.importjs: "olNs_tilegrid.wrapX(#, #, #)".}
proc createForExtent*(extent: JsObject, maxZoom: JsObject = jsUndefined, tileSize: JsObject = jsUndefined, corner: JsObject = jsUndefined): JsObject {.importjs: "olNs_tilegrid.createForExtent(#, #, #, #)".}
proc createXYZ*(options: JsObject = jsUndefined): JsObject {.importjs: "olNs_tilegrid.createXYZ(#)".}
proc createForProjection*(projection: JsObject, maxZoom: JsObject = jsUndefined, tileSize: JsObject = jsUndefined, corner: JsObject = jsUndefined): JsObject {.importjs: "olNs_tilegrid.createForProjection(#, #, #, #)".}
proc extentFromProjection*(projection: JsObject): JsObject {.importjs: "olNs_tilegrid.extentFromProjection(#)".}

proc getTileGrid*(): JsObject {.importjs: "(olNs_tilegrid.TileGrid)".}
proc getWMTS*(): JsObject {.importjs: "(olNs_tilegrid.WMTS)".}

type
  XYZOptions* = ref object of JsRoot

proc newXYZOptions*(): XYZOptions {.importjs: "({})".}
proc `extent=`*(options: XYZOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: XYZOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `maxResolution=`*(options: XYZOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `maxZoom=`*(options: XYZOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: XYZOptions, value: float) {.importjs: "#.minZoom = #".}
proc `tileSize=`*(options: XYZOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: XYZOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: XYZOptions, value: RootRef) {.importjs: "#.tileSize = #".}
