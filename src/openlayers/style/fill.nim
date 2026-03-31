import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Fill from 'ol/style/Fill.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Fill)".}

type
  OlFill* = ref object of JsRoot
proc newOlFill*(options: JsObject = jsUndefined): OlFill {.importjs: "(new olNs_style_Fill.default(#))".}
proc clone*(self: OlFill): JsObject {.importjs: "#.clone()".}
proc getColor*(self: OlFill): JsObject {.importjs: "#.getColor()".}
proc setColor*(self: OlFill, color: JsObject) {.importjs: "#.setColor(#)".}
proc getKey*(self: OlFill): cstring {.importjs: "#.getKey()".}
proc loading*(self: OlFill): bool {.importjs: "#.loading()".}
proc ready*(self: OlFill): JsObject {.importjs: "#.ready()".}
