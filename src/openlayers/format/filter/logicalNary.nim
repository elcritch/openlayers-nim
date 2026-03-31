import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_LogicalNary from 'ol/format/filter/LogicalNary.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_LogicalNary)".}

type
  OlLogicalNary* = ref object of JsRoot
proc newOlLogicalNary*(tagName: cstring, conditions: JsObject): OlLogicalNary {.importjs: "(new olNs_format_filter_LogicalNary.default(#, #))".}
