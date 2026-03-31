import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Intersects from 'ol/format/filter/Intersects.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Intersects)".}

type
  OlIntersects* = ref object of JsRoot
proc newOlIntersects*(geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): OlIntersects {.importjs: "(new olNs_format_filter_Intersects.default(#, #, #))".}
