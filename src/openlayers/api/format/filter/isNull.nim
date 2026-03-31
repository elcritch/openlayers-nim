import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_IsNull from 'ol/format/filter/IsNull.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_IsNull)".}

type
  OlIsNull* = ref object of JsRoot
proc newOlIsNull*(propertyName: cstring): OlIsNull {.importjs: "(new olNs_format_filter_IsNull.default(#))".}
