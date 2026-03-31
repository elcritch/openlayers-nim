import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Bbox from 'ol/format/filter/Bbox.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Bbox)".}

type
  Bbox* = ref object of JsRoot
proc newBbox*(geometryName: cstring, extent: JsObject, srsName: JsObject = jsUndefined): Bbox {.importjs: "(new olNs_format_filter_Bbox.default(#, #, #))".}
