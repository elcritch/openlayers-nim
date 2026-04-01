import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_pixel from 'ol/pixel.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_pixel)".}

proc getNothing*(): JsObject {.importjs: "(olNs_pixel.nothing)".}
