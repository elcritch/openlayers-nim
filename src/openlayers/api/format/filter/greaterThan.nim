import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_GreaterThan from 'ol/format/filter/GreaterThan.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_GreaterThan)".}

type
  OlGreaterThan* = ref object of JsRoot
proc newOlGreaterThan*(propertyName: cstring, expression: float): OlGreaterThan {.importjs: "(new olNs_format_filter_GreaterThan.default(#, #))".}
