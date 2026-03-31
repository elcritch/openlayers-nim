import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_OverviewMap from 'ol/control/OverviewMap.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_OverviewMap)".}

type
  OlOverviewMap* = ref object of JsRoot
proc newOlOverviewMap*(options: JsObject = jsUndefined): OlOverviewMap {.importjs: "(new olNs_control_OverviewMap.default(#))".}
proc getCollapsible*(self: OlOverviewMap): bool {.importjs: "#.getCollapsible()".}
proc setCollapsible*(self: OlOverviewMap, collapsible: bool) {.importjs: "#.setCollapsible(#)".}
proc setCollapsed*(self: OlOverviewMap, collapsed: bool) {.importjs: "#.setCollapsed(#)".}
proc getCollapsed*(self: OlOverviewMap): bool {.importjs: "#.getCollapsed()".}
proc getRotateWithView*(self: OlOverviewMap): bool {.importjs: "#.getRotateWithView()".}
proc setRotateWithView*(self: OlOverviewMap, rotateWithView: bool) {.importjs: "#.setRotateWithView(#)".}
proc getOverviewMap*(self: OlOverviewMap): JsObject {.importjs: "#.getOverviewMap()".}
