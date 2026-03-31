import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_Attribution from 'ol/control/Attribution.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Attribution)".}

type
  OlAttribution* = ref object of JsRoot
proc newOlAttribution*(options: JsObject = jsUndefined): OlAttribution {.importjs: "(new olNs_control_Attribution.default(#))".}
proc getCollapsible*(self: OlAttribution): bool {.importjs: "#.getCollapsible()".}
proc setCollapsible*(self: OlAttribution, collapsible: bool) {.importjs: "#.setCollapsible(#)".}
proc setCollapsed*(self: OlAttribution, collapsed: bool) {.importjs: "#.setCollapsed(#)".}
proc getCollapsed*(self: OlAttribution): bool {.importjs: "#.getCollapsed()".}
