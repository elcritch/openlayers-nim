import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Fill from 'ol/style/Fill.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Fill)".}

type
  FillOptions* = ref object of JsRoot
  Fill* = ref object of JsRoot

proc newFillOptions*(): FillOptions {.importjs: "({})".}
proc `color=`*(options: FillOptions, value: JsObject) {.importjs: "#.color = #".}
proc `color=`*(options: FillOptions, value: cstring) {.importjs: "#.color = #".}

proc newFill*(
  options: JsObject = jsUndefined
): Fill {.importjs: "(new olNs_style_Fill.default(#))".}

proc newFill*(
  options: FillOptions
): Fill {.importjs: "(new olNs_style_Fill.default(#))".}

proc clone*(self: Fill): JsObject {.importjs: "#.clone()".}
proc getColor*(self: Fill): JsObject {.importjs: "#.getColor()".}
proc setColor*(self: Fill, color: JsObject) {.importjs: "#.setColor(#)".}
proc getKey*(self: Fill): cstring {.importjs: "#.getKey()".}
proc loading*(self: Fill): bool {.importjs: "#.loading()".}
proc ready*(self: Fill): JsObject {.importjs: "#.ready()".}
