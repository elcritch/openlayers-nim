import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_size from 'ol/size.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_size)".}

proc buffer*(size: JsObject, num: float, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_size.buffer(#, #, #)".}
proc hasArea*(size: JsObject): bool {.importjs: "olNs_size.hasArea(#)".}
proc scale*(size: JsObject, ratio: float, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_size.scale(#, #, #)".}
proc toSize*(size: JsObject, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_size.toSize(#, #)".}
