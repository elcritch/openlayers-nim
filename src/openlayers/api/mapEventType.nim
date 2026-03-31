import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_MapEventType from 'ol/MapEventType.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_MapEventType)".}
