import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_events_Event from 'ol/events/Event.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events_Event)".}

type
  BaseEvent* = ref object of JsRoot
proc newBaseEvent*(typeVal: cstring): BaseEvent {.importjs: "(new olNs_events_Event.default(#))".}
proc preventDefault*(self: BaseEvent) {.importjs: "#.preventDefault()".}
proc stopPropagation*(self: BaseEvent) {.importjs: "#.stopPropagation()".}

proc stopPropagation2*(evt: JsObject) {.importjs: "olNs_events_Event.stopPropagation(#)".}
proc preventDefault2*(evt: JsObject) {.importjs: "olNs_events_Event.preventDefault(#)".}
