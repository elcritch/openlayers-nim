import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olMapBrowserEventTypeModule from 'ol/MapBrowserEventType.js';".}
when defined(esmModules):
  {.emit: "import mapBrowserEventTypeDefault from 'ol/MapBrowserEventType.js';".}
proc getOlMapBrowserEventType*(): JsObject {.importjs: "(mapBrowserEventTypeDefault)".}
