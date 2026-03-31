import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_events from 'ol/events.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events)".}

proc listen*(target: JsObject, typeVal: cstring, listener: JsObject, thisArg: JsObject = jsUndefined, once: JsObject = jsUndefined): JsObject {.importjs: "olNs_events.listen(#, #, #, #, #)".}
proc listenOnce*(target: JsObject, typeVal: cstring, listener: JsObject, thisArg: JsObject = jsUndefined): JsObject {.importjs: "olNs_events.listenOnce(#, #, #, #)".}
proc unlistenByKey*(key: JsObject) {.importjs: "olNs_events.unlistenByKey(#)".}
