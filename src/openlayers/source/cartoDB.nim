import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_CartoDB from 'ol/source/CartoDB.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_CartoDB)".}

type
  OlCartoDB* = ref object of JsRoot
proc newOlCartoDB*(options: JsObject): OlCartoDB {.importjs: "(new olNs_source_CartoDB.default(#))".}
proc getConfig*(self: OlCartoDB): JsObject {.importjs: "#.getConfig()".}
proc updateConfig*(self: OlCartoDB, config: JsObject) {.importjs: "#.updateConfig(#)".}
proc setConfig*(self: OlCartoDB, config: JsObject) {.importjs: "#.setConfig(#)".}
