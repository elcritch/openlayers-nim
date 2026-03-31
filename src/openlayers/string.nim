import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_string from 'ol/string.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_string)".}

proc padNumber*(number: float, width: float, precision: JsObject = jsUndefined): cstring {.importjs: "olNs_string.padNumber(#, #, #)".}
proc compareVersions*(v1: cstring | float, v2: cstring | float): float {.importjs: "olNs_string.compareVersions(#, #)".}
