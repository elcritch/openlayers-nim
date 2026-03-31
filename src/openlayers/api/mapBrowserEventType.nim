import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_MapBrowserEventType from 'ol/MapBrowserEventType.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_MapBrowserEventType)".}
