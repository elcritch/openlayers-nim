import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Kinetic from 'ol/Kinetic.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Kinetic)".}

type
  OlKinetic* = ref object of JsRoot
proc newOlKinetic*(decay: float, minVelocity: float, delay: float): OlKinetic {.importjs: "(new olNs_Kinetic.default(#, #, #))".}
proc begin*(self: OlKinetic) {.importjs: "#.begin()".}
proc update*(self: OlKinetic, x: float, y: float) {.importjs: "#.update(#, #)".}
proc endVal*(self: OlKinetic): bool {.importjs: "#.end()".}
proc getDistance*(self: OlKinetic): float {.importjs: "#.getDistance()".}
proc getAngle*(self: OlKinetic): float {.importjs: "#.getAngle()".}
