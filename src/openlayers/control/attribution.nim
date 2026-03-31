import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_Attribution from 'ol/control/Attribution.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Attribution)".}

type
  Attribution* = ref object of JsRoot
proc newAttribution*(options: JsObject = jsUndefined): Attribution {.importjs: "(new olNs_control_Attribution.default(#))".}
proc getCollapsible*(self: Attribution): bool {.importjs: "#.getCollapsible()".}
proc setCollapsible*(self: Attribution, collapsible: bool) {.importjs: "#.setCollapsible(#)".}
proc setCollapsed*(self: Attribution, collapsed: bool) {.importjs: "#.setCollapsed(#)".}
proc getCollapsed*(self: Attribution): bool {.importjs: "#.getCollapsed()".}

type
  AttributionOptions* = ref object of JsRoot

proc newAttributionOptions*(): AttributionOptions {.importjs: "({})".}
proc `className=`*(options: AttributionOptions, value: cstring) {.importjs: "#.className = #".}
proc `target=`*(options: AttributionOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: AttributionOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: AttributionOptions, value: RootRef) {.importjs: "#.target = #".}
proc `collapsible=`*(options: AttributionOptions, value: bool) {.importjs: "#.collapsible = #".}
proc `collapsed=`*(options: AttributionOptions, value: bool) {.importjs: "#.collapsed = #".}
proc `tipLabel=`*(options: AttributionOptions, value: cstring) {.importjs: "#.tipLabel = #".}
proc `label=`*(options: AttributionOptions, value: cstring) {.importjs: "#.label = #".}
proc `label=`*(options: AttributionOptions, value: JsObject) {.importjs: "#.label = #".}
proc `label=`*(options: AttributionOptions, value: RootRef) {.importjs: "#.label = #".}
proc `expandClassName=`*(options: AttributionOptions, value: cstring) {.importjs: "#.expandClassName = #".}
proc `collapseLabel=`*(options: AttributionOptions, value: cstring) {.importjs: "#.collapseLabel = #".}
proc `collapseLabel=`*(options: AttributionOptions, value: JsObject) {.importjs: "#.collapseLabel = #".}
proc `collapseLabel=`*(options: AttributionOptions, value: RootRef) {.importjs: "#.collapseLabel = #".}
proc `collapseClassName=`*(options: AttributionOptions, value: cstring) {.importjs: "#.collapseClassName = #".}
proc `render=`*(options: AttributionOptions, value: JsObject) {.importjs: "#.render = #".}
proc `render=`*(options: AttributionOptions, value: RootRef) {.importjs: "#.render = #".}
proc `attributions=`*(options: AttributionOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: AttributionOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}

proc newAttribution*(options: AttributionOptions): Attribution {.importjs: "(new olNs_control_Attribution.default(#))".}
