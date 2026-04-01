import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_easing from 'ol/easing.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_easing)".}

proc easeIn*(t: float): float {.importjs: "olNs_easing.easeIn(#)".}
proc easeOut*(t: float): float {.importjs: "olNs_easing.easeOut(#)".}
proc inAndOut*(t: float): float {.importjs: "olNs_easing.inAndOut(#)".}
proc linear*(t: float): float {.importjs: "olNs_easing.linear(#)".}
proc upAndDown*(t: float): float {.importjs: "olNs_easing.upAndDown(#)".}
