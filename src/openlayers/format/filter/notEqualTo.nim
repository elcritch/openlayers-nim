import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olNs_format_filter_NotEqualTo from 'ol/format/filter/NotEqualTo.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_NotEqualTo)".}

type NotEqualTo* = ref object of JsRoot
proc newNotEqualTo*(
  propertyName: cstring, expression: JsObject, matchCase: JsObject = jsUndefined
): NotEqualTo {.importjs: "(new olNs_format_filter_NotEqualTo.default(#, #, #))".}
