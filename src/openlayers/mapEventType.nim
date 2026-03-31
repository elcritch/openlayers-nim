import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olMapEventTypeModule from 'ol/MapEventType.js';".}
when defined(esmModules):
  {.emit: "import mapEventTypeDefault from 'ol/MapEventType.js';".}
proc getOlMapEventType*(): JsObject {.importjs: "(mapEventTypeDefault)".}
