import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olKineticModule from 'ol/Kinetic.js';".}
{.emit: "import Kinetic from 'ol/Kinetic.js';".}

proc hasKineticModule*(): bool {.importjs: "(typeof olKineticModule !== 'undefined')".}
proc hasKineticConstructor*(): bool {.importjs: "(typeof Kinetic === 'function')".}

type OlKinetic* = ref object of JsRoot

proc newOlKinetic*(
  decay: float, minVelocity: float, delay: float
): OlKinetic {.importjs: "(new Kinetic(#, #, #))".}
