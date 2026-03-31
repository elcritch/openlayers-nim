import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ogcMapUtil from 'ol/source/ogcMapUtil.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ogcMapUtil)".}

proc getRequestUrl*(baseUrl: cstring, extent: JsObject, size: JsObject, projection: JsObject, params: JsObject): cstring {.importjs: "olNs_source_ogcMapUtil.getRequestUrl(#, #, #, #, #)".}
proc getImageSrc*(extent: JsObject, resolution: float, pixelRatio: float, projection: JsObject, url: cstring, params: JsObject): cstring {.importjs: "olNs_source_ogcMapUtil.getImageSrc(#, #, #, #, #, #)".}
proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_ogcMapUtil.createLoader(#)".}
