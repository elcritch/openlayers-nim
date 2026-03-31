import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_asserts from 'ol/asserts.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_asserts)".}

proc assert*(assertion: JsObject, errorMessage: cstring) {.importjs: "olNs_asserts.assert(#, #)".}
