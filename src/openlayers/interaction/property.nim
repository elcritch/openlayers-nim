import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Property from 'ol/interaction/Property.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Property)".}
