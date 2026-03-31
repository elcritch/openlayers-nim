import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_lineoffset from 'ol/geom/flat/lineoffset.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_lineoffset)".}

proc offsetLineString*(flatCoordinates: seq[float], stride: float, offset: float, isClosedRing: bool, dest: JsObject = jsUndefined, destinationStride: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_lineoffset.offsetLineString(#, #, #, #, #, #)".}
proc offsetLineVertex*(x: float, y: float, prevX: float, prevY: float, nextX: float, nextY: float, offset: float): JsObject {.importjs: "olNs_geom_flat_lineoffset.offsetLineVertex(#, #, #, #, #, #, #)".}
