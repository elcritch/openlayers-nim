import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_featureloader from 'ol/featureloader.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_featureloader)".}

proc loadFeaturesXhr*(
  url: JsObject,
  format: JsObject,
  extent: JsObject,
  resolution: float,
  projection: JsObject,
  success: JsObject,
  failure: JsObject,
) {.importjs: "olNs_featureloader.loadFeaturesXhr(#, #, #, #, #, #, #)".}

proc xhr*(
  url: JsObject, format: JsObject
): JsObject {.importjs: "olNs_featureloader.xhr(#, #)".}

proc setWithCredentials*(
  xhrWithCredentials: bool
) {.importjs: "olNs_featureloader.setWithCredentials(#)".}
