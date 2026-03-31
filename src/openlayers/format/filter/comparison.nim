import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Comparison from 'ol/format/filter/Comparison.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Comparison)".}

type
  OlComparison* = ref object of JsRoot
proc newOlComparison*(tagName: cstring, propertyName: cstring): OlComparison {.importjs: "(new olNs_format_filter_Comparison.default(#, #))".}
