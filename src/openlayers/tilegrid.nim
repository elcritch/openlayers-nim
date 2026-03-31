import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
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
