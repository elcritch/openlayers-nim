import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_events_SnapEvent from 'ol/events/SnapEvent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events_SnapEvent)".}
