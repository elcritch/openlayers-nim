import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olNs_format_filter_GreaterThanOrEqualTo from 'ol/format/filter/GreaterThanOrEqualTo.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_GreaterThanOrEqualTo)".}

type GreaterThanOrEqualTo* = ref object of JsRoot
proc newGreaterThanOrEqualTo*(
  propertyName: cstring, expression: float
): GreaterThanOrEqualTo {.
  importjs: "(new olNs_format_filter_GreaterThanOrEqualTo.default(#, #))"
.}
