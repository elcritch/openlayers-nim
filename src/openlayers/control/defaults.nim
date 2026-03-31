import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_defaults from 'ol/control/defaults.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_defaults)".}

proc defaults*(options: JsObject = jsUndefined): JsObject {.importjs: "olNs_control_defaults.defaults(#)".}
