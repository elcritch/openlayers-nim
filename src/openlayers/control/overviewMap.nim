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
