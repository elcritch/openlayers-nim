import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_straightchunk from 'ol/geom/flat/straightchunk.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_straightchunk)".}

proc matchingChunk*(maxAngle: float, flatCoordinates: seq[float], offset: float, endVal: float, stride: float): seq[float] {.importjs: "olNs_geom_flat_straightchunk.matchingChunk(#, #, #, #, #)".}
