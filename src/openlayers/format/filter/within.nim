import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Within from 'ol/format/filter/Within.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Within)".}

type Within* = ref object of JsRoot
proc newWithin*(
  geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined
): Within {.importjs: "(new olNs_format_filter_Within.default(#, #, #))".}
