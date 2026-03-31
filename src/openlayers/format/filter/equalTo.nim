import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit: "import * as olNs_format_filter_EqualTo from 'ol/format/filter/EqualTo.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_EqualTo)".}

type EqualTo* = ref object of JsRoot
proc newEqualTo*(
  propertyName: cstring, expression: JsObject, matchCase: JsObject = jsUndefined
): EqualTo {.importjs: "(new olNs_format_filter_EqualTo.default(#, #, #))".}
