import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_wms from 'ol/source/wms.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_wms)".}

proc getRequestUrl*(baseUrl: cstring, extent: JsObject, size: JsObject, projection: JsObject, params: JsObject): cstring {.importjs: "olNs_source_wms.getRequestUrl(#, #, #, #, #)".}
proc getImageSrc*(extent: JsObject, resolution: float, pixelRatio: float, projection: JsObject, url: cstring, params: JsObject, serverType: JsObject): cstring {.importjs: "olNs_source_wms.getImageSrc(#, #, #, #, #, #, #)".}
proc getRequestParams*(params: JsObject, request: cstring): JsObject {.importjs: "olNs_source_wms.getRequestParams(#, #)".}
proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_wms.createLoader(#)".}
proc getFeatureInfoUrl*(options: JsObject, coordinate: JsObject, resolution: float): cstring {.importjs: "olNs_source_wms.getFeatureInfoUrl(#, #, #)".}
proc getLegendUrl*(options: JsObject, resolution: JsObject = jsUndefined): cstring {.importjs: "olNs_source_wms.getLegendUrl(#, #)".}

proc getDEFAULT_VERSION*(): cstring {.importjs: "(olNs_source_wms.DEFAULT_VERSION)".}
