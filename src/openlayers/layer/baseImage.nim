import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_BaseImage from 'ol/layer/BaseImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_BaseImage)".}

type
  OlBaseImageLayer* = ref object of JsRoot
proc newOlBaseImageLayer*(): OlBaseImageLayer {.importjs: "(new olNs_layer_BaseImage.default())".}
