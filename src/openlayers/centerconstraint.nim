import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_centerconstraint from 'ol/centerconstraint.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_centerconstraint)".}

proc createExtent*(extent: JsObject, onlyCenter: bool, smooth: bool): JsObject {.importjs: "olNs_centerconstraint.createExtent(#, #, #)".}
proc none*(center: JsObject = jsUndefined): JsObject {.importjs: "olNs_centerconstraint.none(#)".}
