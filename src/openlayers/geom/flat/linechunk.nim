import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_linechunk from 'ol/geom/flat/linechunk.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_linechunk)".}

proc lineChunk*(chunkLength: float, flatCoordinates: seq[float], offset: float, endVal: float, stride: float): JsObject {.importjs: "olNs_geom_flat_linechunk.lineChunk(#, #, #, #, #)".}
