import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_arcgisRest from 'ol/source/arcgisRest.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_arcgisRest)".}

proc getRequestUrl*(baseUrl: cstring, extent: JsObject, resolution: float, pixelRatio: float, projection: JsObject, params: JsObject): cstring {.importjs: "olNs_source_arcgisRest.getRequestUrl(#, #, #, #, #, #)".}
proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_arcgisRest.createLoader(#)".}
