import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_rotationconstraint from 'ol/rotationconstraint.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_rotationconstraint)".}

proc disable*(rotation: float): float {.importjs: "olNs_rotationconstraint.disable(#)".}
proc none*(rotation: float): float {.importjs: "olNs_rotationconstraint.none(#)".}
proc createSnapToN*(n: float): JsObject {.importjs: "olNs_rotationconstraint.createSnapToN(#)".}
proc createSnapToZero*(tolerance: JsObject = jsUndefined): JsObject {.importjs: "olNs_rotationconstraint.createSnapToZero(#)".}
