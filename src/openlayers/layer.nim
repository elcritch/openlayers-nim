import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olLayerNamespace from 'ol/layer.js';".}

proc getLayerNamespace*(): JsObject {.importjs: "(olLayerNamespace)".}
