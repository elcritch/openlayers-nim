import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Kinetic from 'ol/Kinetic.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Kinetic)".}

type Kinetic* = ref object of JsRoot
proc newKinetic*(
  decay: float, minVelocity: float, delay: float
): Kinetic {.importjs: "(new olNs_Kinetic.default(#, #, #))".}

proc begin*(self: Kinetic) {.importjs: "#.begin()".}
proc update*(self: Kinetic, x: float, y: float) {.importjs: "#.update(#, #)".}
proc endVal*(self: Kinetic): bool {.importjs: "#.end()".}
proc getDistance*(self: Kinetic): float {.importjs: "#.getDistance()".}
proc getAngle*(self: Kinetic): float {.importjs: "#.getAngle()".}
