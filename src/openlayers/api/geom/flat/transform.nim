import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_transform from 'ol/geom/flat/transform.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_transform)".}

proc transform2D*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, transform: JsObject, dest: JsObject = jsUndefined, destinationStride: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_transform.transform2D(#, #, #, #, #, #, #)".}
proc rotate*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, angle: float, anchor: seq[float], dest: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_transform.rotate(#, #, #, #, #, #, #)".}
proc scale*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, sx: float, sy: float, anchor: seq[float], dest: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_transform.scale(#, #, #, #, #, #, #, #)".}
proc translate*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, deltaX: float, deltaY: float, dest: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_flat_transform.translate(#, #, #, #, #, #, #)".}
