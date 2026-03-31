import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_interpolate from 'ol/geom/flat/interpolate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_interpolate)".}

proc interpolatePoint*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, fraction: float, dest: JsObject = jsUndefined, dimension: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_interpolate.interpolatePoint(#, #, #, #, #, #, #)".}
proc lineStringCoordinateAtM*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, m: float, extrapolate: bool): JsObject {.importjs: "olNs_geom_flat_interpolate.lineStringCoordinateAtM(#, #, #, #, #, #)".}
proc lineStringsCoordinateAtM*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, m: float, extrapolate: bool, interpolate: bool): JsObject {.importjs: "olNs_geom_flat_interpolate.lineStringsCoordinateAtM(#, #, #, #, #, #, #)".}
