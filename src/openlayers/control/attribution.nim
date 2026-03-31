import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_Attribution from 'ol/control/Attribution.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Attribution)".}

type
  OlAttributionOptions* = ref object of JsRoot
  OlAttribution* = ref object of JsRoot

proc newOlAttributionOptions*(): OlAttributionOptions {.importjs: "({})".}
proc `className=`*(
  options: OlAttributionOptions, value: cstring
) {.importjs: "#.className = #".}

proc `target=`*(
  options: OlAttributionOptions, value: cstring
) {.importjs: "#.target = #".}

proc `target=`*(
  options: OlAttributionOptions, value: JsObject
) {.importjs: "#.target = #".}

proc `collapsible=`*(
  options: OlAttributionOptions, value: bool
) {.importjs: "#.collapsible = #".}

proc `collapsed=`*(
  options: OlAttributionOptions, value: bool
) {.importjs: "#.collapsed = #".}

proc `tipLabel=`*(
  options: OlAttributionOptions, value: cstring
) {.importjs: "#.tipLabel = #".}

proc `label=`*(
  options: OlAttributionOptions, value: cstring
) {.importjs: "#.label = #".}

proc `label=`*(
  options: OlAttributionOptions, value: JsObject
) {.importjs: "#.label = #".}

proc `expandClassName=`*(
  options: OlAttributionOptions, value: cstring
) {.importjs: "#.expandClassName = #".}

proc `collapseLabel=`*(
  options: OlAttributionOptions, value: cstring
) {.importjs: "#.collapseLabel = #".}

proc `collapseLabel=`*(
  options: OlAttributionOptions, value: JsObject
) {.importjs: "#.collapseLabel = #".}

proc `collapseClassName=`*(
  options: OlAttributionOptions, value: cstring
) {.importjs: "#.collapseClassName = #".}

proc `render=`*(
  options: OlAttributionOptions, value: JsObject
) {.importjs: "#.render = #".}

proc `attributions=`*(
  options: OlAttributionOptions, value: cstring
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: OlAttributionOptions, value: seq[cstring]
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: OlAttributionOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc newOlAttribution*(
  options: JsObject = jsUndefined
): OlAttribution {.importjs: "(new olNs_control_Attribution.default(#))".}

proc newOlAttribution*(
  options: OlAttributionOptions
): OlAttribution {.importjs: "(new olNs_control_Attribution.default(#))".}

proc getCollapsible*(self: OlAttribution): bool {.importjs: "#.getCollapsible()".}
proc setCollapsible*(
  self: OlAttribution, collapsible: bool
) {.importjs: "#.setCollapsible(#)".}

proc setCollapsed*(
  self: OlAttribution, collapsed: bool
) {.importjs: "#.setCollapsed(#)".}

proc getCollapsed*(self: OlAttribution): bool {.importjs: "#.getCollapsed()".}
