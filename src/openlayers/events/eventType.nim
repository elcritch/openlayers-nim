import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_events_EventType from 'ol/events/EventType.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events_EventType)".}
