import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_EsriJSON from 'ol/format/EsriJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_EsriJSON)".}

type
  OlEsriJSON* = ref object of JsRoot
proc newOlEsriJSON*(): OlEsriJSON {.importjs: "(new olNs_format_EsriJSON.default())".}
