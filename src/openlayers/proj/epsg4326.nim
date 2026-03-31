import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_epsg4326 from 'ol/proj/epsg4326.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_epsg4326)".}

proc getRADIUS*(): float {.importjs: "(olNs_proj_epsg4326.RADIUS)".}
proc getEXTENT*(): JsObject {.importjs: "(olNs_proj_epsg4326.EXTENT)".}
proc getMETERS_PER_UNIT*(): float {.importjs: "(olNs_proj_epsg4326.METERS_PER_UNIT)".}
proc getPROJECTIONS*(): JsObject {.importjs: "(olNs_proj_epsg4326.PROJECTIONS)".}
