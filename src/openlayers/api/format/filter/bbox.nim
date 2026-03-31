import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Bbox from 'ol/format/filter/Bbox.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Bbox)".}

type
  OlBbox* = ref object of JsRoot
proc newOlBbox*(geometryName: cstring, extent: JsObject, srsName: JsObject = jsUndefined): OlBbox {.importjs: "(new olNs_format_filter_Bbox.default(#, #, #))".}
