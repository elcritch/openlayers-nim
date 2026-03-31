import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_tilegrid_WMTS from 'ol/tilegrid/WMTS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_tilegrid_WMTS)".}

type
  OlWMTSTileGrid* = ref object of JsRoot
proc newOlWMTSTileGrid*(options: JsObject): OlWMTSTileGrid {.importjs: "(new olNs_tilegrid_WMTS.default(#))".}
proc getMatrixId*(self: OlWMTSTileGrid, z: float): cstring {.importjs: "#.getMatrixId(#)".}
proc getMatrixIds*(self: OlWMTSTileGrid): seq[cstring] {.importjs: "#.getMatrixIds()".}

proc createFromCapabilitiesMatrixSet*(matrixSet: JsObject, extent: JsObject = jsUndefined, matrixLimits: JsObject = jsUndefined): JsObject {.importjs: "olNs_tilegrid_WMTS.createFromCapabilitiesMatrixSet(#, #, #)".}
