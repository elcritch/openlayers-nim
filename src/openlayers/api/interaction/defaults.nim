import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_defaults from 'ol/interaction/defaults.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_defaults)".}

proc defaults*(options: JsObject = jsUndefined): JsObject {.importjs: "olNs_interaction_defaults.defaults(#)".}
