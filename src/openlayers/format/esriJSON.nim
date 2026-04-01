import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_EsriJSON from 'ol/format/EsriJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_EsriJSON)".}

type
  EsriJSON* = ref object of JsRoot
proc newEsriJSON*(): EsriJSON {.importjs: "(new olNs_format_EsriJSON.default())".}

type
  EsriJSONOptions* = ref object of JsRoot

proc newEsriJSONOptions*(): EsriJSONOptions {.importjs: "({})".}
proc `geometryName=`*(options: EsriJSONOptions, value: cstring) {.importjs: "#.geometryName = #".}

proc newEsriJSON*(options: EsriJSONOptions): EsriJSON {.importjs: "(new olNs_format_EsriJSON.default(#))".}
