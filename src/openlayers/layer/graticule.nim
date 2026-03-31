import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Graticule from 'ol/layer/Graticule.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Graticule)".}

type
  OlGraticule* = ref object of JsRoot
proc newOlGraticule*(): OlGraticule {.importjs: "(new olNs_layer_Graticule.default())".}
