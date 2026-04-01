import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_filter_GreaterThan from 'ol/format/filter/GreaterThan.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_GreaterThan)".}

type
  GreaterThan* = ref object of JsRoot
proc newGreaterThan*(propertyName: cstring, expression: float): GreaterThan {.importjs: "(new olNs_format_filter_GreaterThan.default(#, #))".}
