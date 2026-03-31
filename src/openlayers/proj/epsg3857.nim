import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_epsg3857 from 'ol/proj/epsg3857.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_epsg3857)".}

proc fromEPSG4326*(input: seq[float], output: JsObject = jsUndefined, dimension: JsObject = jsUndefined, stride: JsObject = jsUndefined): seq[float] {.importjs: "olNs_proj_epsg3857.fromEPSG4326(#, #, #, #)".}
proc toEPSG4326*(input: seq[float], output: JsObject = jsUndefined, dimension: JsObject = jsUndefined, stride: JsObject = jsUndefined): seq[float] {.importjs: "olNs_proj_epsg3857.toEPSG4326(#, #, #, #)".}

proc getRADIUS*(): float {.importjs: "(olNs_proj_epsg3857.RADIUS)".}
proc getHALF_SIZE*(): float {.importjs: "(olNs_proj_epsg3857.HALF_SIZE)".}
proc getEXTENT*(): JsObject {.importjs: "(olNs_proj_epsg3857.EXTENT)".}
proc getWORLD_EXTENT*(): JsObject {.importjs: "(olNs_proj_epsg3857.WORLD_EXTENT)".}
proc getMAX_SAFE_Y*(): float {.importjs: "(olNs_proj_epsg3857.MAX_SAFE_Y)".}
proc getPROJECTIONS*(): JsObject {.importjs: "(olNs_proj_epsg3857.PROJECTIONS)".}
