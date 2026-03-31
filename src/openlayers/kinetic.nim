import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olKineticModule from 'ol/Kinetic.js';".}
when defined(esmModules):
  {.emit: "import Kinetic from 'ol/Kinetic.js';".}

type OlKinetic* = ref object of JsRoot

proc newOlKinetic*(
  decay: float, minVelocity: float, delay: float
): OlKinetic {.importjs: "(new Kinetic(#, #, #))".}
