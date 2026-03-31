import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Image from 'ol/layer/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Image)".}

type
  OlImageLayer* = ref object of JsRoot
proc newOlImageLayer*(options: JsObject = jsUndefined): OlImageLayer {.importjs: "(new olNs_layer_Image.default(#))".}
