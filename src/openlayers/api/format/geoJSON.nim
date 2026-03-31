import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GeoJSON from 'ol/format/GeoJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GeoJSON)".}

type
  OlGeoJSON* = ref object of JsRoot
proc newOlGeoJSON*(): OlGeoJSON {.importjs: "(new olNs_format_GeoJSON.default())".}
