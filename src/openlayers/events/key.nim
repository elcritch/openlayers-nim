import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_events_Key from 'ol/events/Key.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events_Key)".}
