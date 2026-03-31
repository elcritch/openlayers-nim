import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Spatial from 'ol/format/filter/Spatial.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Spatial)".}

type
  OlSpatial* = ref object of JsRoot
proc newOlSpatial*(tagName: cstring, geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): OlSpatial {.importjs: "(new olNs_format_filter_Spatial.default(#, #, #, #))".}
