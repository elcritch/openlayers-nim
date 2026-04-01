import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_colorlike from 'ol/colorlike.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_colorlike)".}

proc asColorLike*(color: JsObject): JsObject {.importjs: "olNs_colorlike.asColorLike(#)".}
