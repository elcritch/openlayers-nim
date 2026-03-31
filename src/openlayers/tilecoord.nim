import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_tilecoord from 'ol/tilecoord.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_tilecoord)".}

proc createOrUpdate*(
  z: float, x: float, y: float, tileCoord: JsObject = jsUndefined
): JsObject {.importjs: "olNs_tilecoord.createOrUpdate(#, #, #, #)".}

proc getKeyZXY*(
  z: float, x: float, y: float
): cstring {.importjs: "olNs_tilecoord.getKeyZXY(#, #, #)".}

proc getKey*(tileCoord: JsObject): cstring {.importjs: "olNs_tilecoord.getKey(#)".}
proc getCacheKeyForTileKey*(
  tileKey: cstring
): cstring {.importjs: "olNs_tilecoord.getCacheKeyForTileKey(#)".}

proc getCacheKey*(
  source: JsObject, sourceKey: cstring, z: float, x: float, y: float
): cstring {.importjs: "olNs_tilecoord.getCacheKey(#, #, #, #, #)".}

proc fromKey*(key: cstring): JsObject {.importjs: "olNs_tilecoord.fromKey(#)".}
proc hash*(tileCoord: JsObject): float {.importjs: "olNs_tilecoord.hash(#)".}
proc hashZXY*(
  z: float, x: float, y: float
): float {.importjs: "olNs_tilecoord.hashZXY(#, #, #)".}

proc withinExtentAndZ*(
  tileCoord: JsObject, tileGrid: JsObject
): bool {.importjs: "olNs_tilecoord.withinExtentAndZ(#, #)".}
