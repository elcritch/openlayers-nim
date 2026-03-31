import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_IsBetween from 'ol/format/filter/IsBetween.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_IsBetween)".}

type
  OlIsBetween* = ref object of JsRoot
proc newOlIsBetween*(propertyName: cstring, lowerBoundary: float, upperBoundary: float): OlIsBetween {.importjs: "(new olNs_format_filter_IsBetween.default(#, #, #))".}
