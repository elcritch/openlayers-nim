import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_tilegrid_common from 'ol/tilegrid/common.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_tilegrid_common)".}

proc getDEFAULT_MAX_ZOOM*(): float {.importjs: "(olNs_tilegrid_common.DEFAULT_MAX_ZOOM)".}
proc getDEFAULT_TILE_SIZE*(): float {.importjs: "(olNs_tilegrid_common.DEFAULT_TILE_SIZE)".}
