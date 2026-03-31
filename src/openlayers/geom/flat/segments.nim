import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_segments from 'ol/geom/flat/segments.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_segments)".}

proc forEach*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, callback: JsObject): JsObject {.importjs: "olNs_geom_flat_segments.forEach(#, #, #, #, #)".}
proc getIntersectionPoint*(segment1: JsObject, segment2: JsObject): JsObject {.importjs: "olNs_geom_flat_segments.getIntersectionPoint(#, #)".}
