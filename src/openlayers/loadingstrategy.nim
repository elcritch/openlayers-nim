import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_loadingstrategy from 'ol/loadingstrategy.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_loadingstrategy)".}

proc all*(
  extent: JsObject, resolution: float
): JsObject {.importjs: "olNs_loadingstrategy.all(#, #)".}

proc bbox*(
  extent: JsObject, resolution: float
): JsObject {.importjs: "olNs_loadingstrategy.bbox(#, #)".}

proc tile*(tileGrid: JsObject): JsObject {.importjs: "olNs_loadingstrategy.tile(#)".}
