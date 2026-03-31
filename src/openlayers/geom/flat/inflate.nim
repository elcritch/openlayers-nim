import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_inflate from 'ol/geom/flat/inflate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_inflate)".}

proc inflateCoordinates*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, coordinates: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_flat_inflate.inflateCoordinates(#, #, #, #, #)".}
proc inflateCoordinatesArray*(flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, coordinatess: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_flat_inflate.inflateCoordinatesArray(#, #, #, #, #)".}
proc inflateMultiCoordinatesArray*(flatCoordinates: seq[float], offset: float, endss: JsObject, stride: float, coordinatesss: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_flat_inflate.inflateMultiCoordinatesArray(#, #, #, #, #)".}
