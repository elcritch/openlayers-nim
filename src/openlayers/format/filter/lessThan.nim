import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_filter_LessThan from 'ol/format/filter/LessThan.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_LessThan)".}

type
  LessThan* = ref object of JsRoot
proc newLessThan*(propertyName: cstring, expression: float): LessThan {.importjs: "(new olNs_format_filter_LessThan.default(#, #))".}
