import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_BaseImage from 'ol/layer/BaseImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_BaseImage)".}

type
  BaseImageLayer* = ref object of JsRoot
proc newBaseImageLayer*(): BaseImageLayer {.importjs: "(new olNs_layer_BaseImage.default())".}
