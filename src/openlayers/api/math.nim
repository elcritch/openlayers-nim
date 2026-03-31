import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_math from 'ol/math.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_math)".}

proc clamp*(value: float, min: float, max: float): float {.importjs: "olNs_math.clamp(#, #, #)".}
proc squaredSegmentDistance*(x: float, y: float, x1: float, y1: float, x2: float, y2: float): float {.importjs: "olNs_math.squaredSegmentDistance(#, #, #, #, #, #)".}
proc squaredDistance*(x1: float, y1: float, x2: float, y2: float): float {.importjs: "olNs_math.squaredDistance(#, #, #, #)".}
proc solveLinearSystem*(mat: JsObject): JsObject {.importjs: "olNs_math.solveLinearSystem(#)".}
proc toDegrees*(angleInRadians: float): float {.importjs: "olNs_math.toDegrees(#)".}
proc toRadians*(angleInDegrees: float): float {.importjs: "olNs_math.toRadians(#)".}
proc modulo*(a: float, b: float): float {.importjs: "olNs_math.modulo(#, #)".}
proc lerp*(a: float, b: float, x: float): float {.importjs: "olNs_math.lerp(#, #, #)".}
proc toFixed*(n: float, decimals: float): float {.importjs: "olNs_math.toFixed(#, #)".}
proc round*(n: float, decimals: float): float {.importjs: "olNs_math.round(#, #)".}
proc floor*(n: float, decimals: float): float {.importjs: "olNs_math.floor(#, #)".}
proc ceil*(n: float, decimals: float): float {.importjs: "olNs_math.ceil(#, #)".}
proc wrap*(n: float, min: float, max: float): float {.importjs: "olNs_math.wrap(#, #, #)".}
