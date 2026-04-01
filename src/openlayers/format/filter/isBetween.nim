import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_filter_IsBetween from 'ol/format/filter/IsBetween.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_IsBetween)".}

type
  IsBetween* = ref object of JsRoot
proc newIsBetween*(propertyName: cstring, lowerBoundary: float, upperBoundary: float): IsBetween {.importjs: "(new olNs_format_filter_IsBetween.default(#, #, #))".}
