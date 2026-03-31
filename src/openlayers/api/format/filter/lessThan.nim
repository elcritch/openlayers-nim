import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_LessThan from 'ol/format/filter/LessThan.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_LessThan)".}

type
  OlLessThan* = ref object of JsRoot
proc newOlLessThan*(propertyName: cstring, expression: float): OlLessThan {.importjs: "(new olNs_format_filter_LessThan.default(#, #))".}
