import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_coordinate from 'ol/coordinate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_coordinate)".}

proc add*(coordinate: JsObject, delta: JsObject): JsObject {.importjs: "olNs_coordinate.add(#, #)".}
proc closestOnCircle*(coordinate: JsObject, circle: JsObject): JsObject {.importjs: "olNs_coordinate.closestOnCircle(#, #)".}
proc closestOnSegment*(coordinate: JsObject, segment: JsObject): JsObject {.importjs: "olNs_coordinate.closestOnSegment(#, #)".}
proc createStringXY*(fractionDigits: JsObject = jsUndefined): JsObject {.importjs: "olNs_coordinate.createStringXY(#)".}
proc degreesToStringHDMS*(hemispheres: cstring, degrees: float, fractionDigits: JsObject = jsUndefined): cstring {.importjs: "olNs_coordinate.degreesToStringHDMS(#, #, #)".}
proc format*(coordinate: JsObject, templateVal: cstring, fractionDigits: JsObject = jsUndefined): cstring {.importjs: "olNs_coordinate.format(#, #, #)".}
proc equals*(coordinate1: JsObject, coordinate2: JsObject): bool {.importjs: "olNs_coordinate.equals(#, #)".}
proc rotate*(coordinate: JsObject, angle: float): JsObject {.importjs: "olNs_coordinate.rotate(#, #)".}
proc scale*(coordinate: JsObject, scale: float): JsObject {.importjs: "olNs_coordinate.scale(#, #)".}
proc squaredDistance*(coord1: JsObject, coord2: JsObject): float {.importjs: "olNs_coordinate.squaredDistance(#, #)".}
proc distance*(coord1: JsObject, coord2: JsObject): float {.importjs: "olNs_coordinate.distance(#, #)".}
proc squaredDistanceToSegment*(coordinate: JsObject, segment: JsObject): float {.importjs: "olNs_coordinate.squaredDistanceToSegment(#, #)".}
proc toStringHDMS*(coordinate: JsObject, fractionDigits: JsObject = jsUndefined): cstring {.importjs: "olNs_coordinate.toStringHDMS(#, #)".}
proc toStringXY*(coordinate: JsObject, fractionDigits: JsObject = jsUndefined): cstring {.importjs: "olNs_coordinate.toStringXY(#, #)".}
proc wrapX*(coordinate: JsObject, projection: JsObject): JsObject {.importjs: "olNs_coordinate.wrapX(#, #)".}
proc getWorldsAway*(coordinate: JsObject, projection: JsObject, sourceExtentWidth: JsObject = jsUndefined): float {.importjs: "olNs_coordinate.getWorldsAway(#, #, #)".}
proc angleBetween*(p0: JsObject, pA: JsObject, pB: JsObject): float {.importjs: "olNs_coordinate.angleBetween(#, #, #)".}
