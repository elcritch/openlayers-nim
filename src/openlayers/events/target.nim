import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_events_Target from 'ol/events/Target.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events_Target)".}

type
  Target* = ref object of JsRoot
proc newTarget*(target: JsObject = jsUndefined): Target {.importjs: "(new olNs_events_Target.default(#))".}
proc addEventListener*(self: Target, typeVal: cstring, listener: JsObject) {.importjs: "#.addEventListener(#, #)".}
proc dispatchEvent*(self: Target, event: JsObject): bool {.importjs: "#.dispatchEvent(#)".}
proc getListeners*(self: Target, typeVal: cstring): JsObject {.importjs: "#.getListeners(#)".}
proc hasListener*(self: Target, typeVal: JsObject = jsUndefined): bool {.importjs: "#.hasListener(#)".}
proc removeEventListener*(self: Target, typeVal: cstring, listener: JsObject) {.importjs: "#.removeEventListener(#, #)".}
