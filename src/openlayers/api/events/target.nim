import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_events_Target from 'ol/events/Target.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events_Target)".}

type
  OlTarget* = ref object of JsRoot
proc newOlTarget*(target: JsObject = jsUndefined): OlTarget {.importjs: "(new olNs_events_Target.default(#))".}
proc addEventListener*(self: OlTarget, typeVal: cstring, listener: JsObject) {.importjs: "#.addEventListener(#, #)".}
proc dispatchEvent*(self: OlTarget, event: JsObject): bool {.importjs: "#.dispatchEvent(#)".}
proc getListeners*(self: OlTarget, typeVal: cstring): JsObject {.importjs: "#.getListeners(#)".}
proc hasListener*(self: OlTarget, typeVal: JsObject = jsUndefined): bool {.importjs: "#.hasListener(#)".}
proc removeEventListener*(self: OlTarget, typeVal: cstring, listener: JsObject) {.importjs: "#.removeEventListener(#, #)".}
