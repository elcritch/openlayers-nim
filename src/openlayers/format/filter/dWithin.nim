import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_DWithin from 'ol/format/filter/DWithin.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_DWithin)".}

type
  DWithin* = ref object of JsRoot
proc newDWithin*(geometryName: cstring, geometry: JsObject, distance: float, unit: cstring, srsName: JsObject = jsUndefined): DWithin {.importjs: "(new olNs_format_filter_DWithin.default(#, #, #, #, #))".}
