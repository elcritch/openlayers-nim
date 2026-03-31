import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Within from 'ol/format/filter/Within.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Within)".}

type
  OlWithin* = ref object of JsRoot
proc newOlWithin*(geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): OlWithin {.importjs: "(new olNs_format_filter_Within.default(#, #, #))".}
