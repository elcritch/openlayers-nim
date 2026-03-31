import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olObjectEventTypeModule from 'ol/ObjectEventType.js';".}
when defined(esmModules):
  {.emit: "import objectEventTypeDefault from 'ol/ObjectEventType.js';".}
proc getOlObjectEventType*(): JsObject {.importjs: "(objectEventTypeDefault)".}
