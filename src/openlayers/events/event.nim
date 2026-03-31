import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_events_Event from 'ol/events/Event.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events_Event)".}

type
  OlBaseEvent* = ref object of JsRoot
proc newOlBaseEvent*(typeVal: cstring): OlBaseEvent {.importjs: "(new olNs_events_Event.default(#))".}
proc preventDefault*(self: OlBaseEvent) {.importjs: "#.preventDefault()".}
proc stopPropagation*(self: OlBaseEvent) {.importjs: "#.stopPropagation()".}

proc stopPropagation2*(evt: JsObject) {.importjs: "olNs_events_Event.stopPropagation(#)".}
proc preventDefault2*(evt: JsObject) {.importjs: "olNs_events_Event.preventDefault(#)".}
