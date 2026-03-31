import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_pointer_EventType from 'ol/pointer/EventType.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_pointer_EventType)".}
