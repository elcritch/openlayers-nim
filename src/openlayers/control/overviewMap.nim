import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_OverviewMap from 'ol/control/OverviewMap.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_OverviewMap)".}

type
  OverviewMap* = ref object of JsRoot
proc newOverviewMap*(options: JsObject = jsUndefined): OverviewMap {.importjs: "(new olNs_control_OverviewMap.default(#))".}
proc getCollapsible*(self: OverviewMap): bool {.importjs: "#.getCollapsible()".}
proc setCollapsible*(self: OverviewMap, collapsible: bool) {.importjs: "#.setCollapsible(#)".}
proc setCollapsed*(self: OverviewMap, collapsed: bool) {.importjs: "#.setCollapsed(#)".}
proc getCollapsed*(self: OverviewMap): bool {.importjs: "#.getCollapsed()".}
proc getRotateWithView*(self: OverviewMap): bool {.importjs: "#.getRotateWithView()".}
proc setRotateWithView*(self: OverviewMap, rotateWithView: bool) {.importjs: "#.setRotateWithView(#)".}
proc getOverviewMap*(self: OverviewMap): JsObject {.importjs: "#.getOverviewMap()".}

type
  OverviewMapOptions* = ref object of JsRoot

proc newOverviewMapOptions*(): OverviewMapOptions {.importjs: "({})".}
proc `className=`*(options: OverviewMapOptions, value: cstring) {.importjs: "#.className = #".}
proc `collapsed=`*(options: OverviewMapOptions, value: bool) {.importjs: "#.collapsed = #".}
proc `collapseLabel=`*(options: OverviewMapOptions, value: cstring) {.importjs: "#.collapseLabel = #".}
proc `collapseLabel=`*(options: OverviewMapOptions, value: JsObject) {.importjs: "#.collapseLabel = #".}
proc `collapseLabel=`*(options: OverviewMapOptions, value: RootRef) {.importjs: "#.collapseLabel = #".}
proc `collapsible=`*(options: OverviewMapOptions, value: bool) {.importjs: "#.collapsible = #".}
proc `label=`*(options: OverviewMapOptions, value: cstring) {.importjs: "#.label = #".}
proc `label=`*(options: OverviewMapOptions, value: JsObject) {.importjs: "#.label = #".}
proc `label=`*(options: OverviewMapOptions, value: RootRef) {.importjs: "#.label = #".}
proc `layers=`*(options: OverviewMapOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `layers=`*(options: OverviewMapOptions, value: RootRef) {.importjs: "#.layers = #".}
proc `layers=`*[T](options: OverviewMapOptions, value: seq[T]) {.importjs: "#.layers = #".}
proc `render=`*(options: OverviewMapOptions, value: JsObject) {.importjs: "#.render = #".}
proc `render=`*(options: OverviewMapOptions, value: RootRef) {.importjs: "#.render = #".}
proc `rotateWithView=`*(options: OverviewMapOptions, value: bool) {.importjs: "#.rotateWithView = #".}
proc `target=`*(options: OverviewMapOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: OverviewMapOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: OverviewMapOptions, value: RootRef) {.importjs: "#.target = #".}
proc `tipLabel=`*(options: OverviewMapOptions, value: cstring) {.importjs: "#.tipLabel = #".}
proc `view=`*(options: OverviewMapOptions, value: JsObject) {.importjs: "#.view = #".}
proc `view=`*(options: OverviewMapOptions, value: RootRef) {.importjs: "#.view = #".}

proc newOverviewMap*(options: OverviewMapOptions): OverviewMap {.importjs: "(new olNs_control_OverviewMap.default(#))".}
