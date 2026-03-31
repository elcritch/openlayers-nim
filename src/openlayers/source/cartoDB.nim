import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_CartoDB from 'ol/source/CartoDB.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_CartoDB)".}

type
  CartoDB* = ref object of JsRoot
proc newCartoDB*(options: JsObject): CartoDB {.importjs: "(new olNs_source_CartoDB.default(#))".}
proc getConfig*(self: CartoDB): JsObject {.importjs: "#.getConfig()".}
proc updateConfig*(self: CartoDB, config: JsObject) {.importjs: "#.updateConfig(#)".}
proc setConfig*(self: CartoDB, config: JsObject) {.importjs: "#.setConfig(#)".}
