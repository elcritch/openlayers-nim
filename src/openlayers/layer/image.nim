import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Image from 'ol/layer/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Image)".}

type ImageLayer* = ref object of JsRoot
proc newImageLayer*(
  options: JsObject = jsUndefined
): ImageLayer {.importjs: "(new olNs_layer_Image.default(#))".}
