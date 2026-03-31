import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Property from 'ol/layer/Property.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Property)".}
