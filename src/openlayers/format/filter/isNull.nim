import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_filter_IsNull from 'ol/format/filter/IsNull.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_IsNull)".}

type
  IsNull* = ref object of JsRoot
proc newIsNull*(propertyName: cstring): IsNull {.importjs: "(new olNs_format_filter_IsNull.default(#))".}
