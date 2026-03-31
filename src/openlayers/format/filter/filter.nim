import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Filter from 'ol/format/filter/Filter.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Filter)".}

type
  OlFilter* = ref object of JsRoot
proc newOlFilter*(tagName: cstring): OlFilter {.importjs: "(new olNs_format_filter_Filter.default(#))".}
proc getTagName*(self: OlFilter): cstring {.importjs: "#.getTagName()".}
