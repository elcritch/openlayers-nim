import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_filter_LessThanOrEqualTo from 'ol/format/filter/LessThanOrEqualTo.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_LessThanOrEqualTo)".}

type
  LessThanOrEqualTo* = ref object of JsRoot
proc newLessThanOrEqualTo*(propertyName: cstring, expression: float): LessThanOrEqualTo {.importjs: "(new olNs_format_filter_LessThanOrEqualTo.default(#, #))".}
