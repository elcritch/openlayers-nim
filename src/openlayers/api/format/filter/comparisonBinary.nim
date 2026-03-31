import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_ComparisonBinary from 'ol/format/filter/ComparisonBinary.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_ComparisonBinary)".}

type
  OlComparisonBinary* = ref object of JsRoot
proc newOlComparisonBinary*(tagName: cstring, propertyName: cstring, expression: JsObject, matchCase: JsObject = jsUndefined): OlComparisonBinary {.importjs: "(new olNs_format_filter_ComparisonBinary.default(#, #, #, #))".}
