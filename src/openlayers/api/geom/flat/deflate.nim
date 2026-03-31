import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_deflate from 'ol/geom/flat/deflate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_deflate)".}

proc deflateCoordinate*(flatCoordinates: seq[float], offset: float, coordinate: JsObject, stride: float): float {.importjs: "olNs_geom_flat_deflate.deflateCoordinate(#, #, #, #)".}
proc deflateCoordinates*(flatCoordinates: seq[float], offset: float, coordinates: JsObject, stride: float): float {.importjs: "olNs_geom_flat_deflate.deflateCoordinates(#, #, #, #)".}
proc deflateCoordinatesArray*(flatCoordinates: seq[float], offset: float, coordinatess: JsObject, stride: float, ends: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_deflate.deflateCoordinatesArray(#, #, #, #, #)".}
proc deflateMultiCoordinatesArray*(flatCoordinates: seq[float], offset: float, coordinatesss: JsObject, stride: float, endss: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_flat_deflate.deflateMultiCoordinatesArray(#, #, #, #, #)".}
