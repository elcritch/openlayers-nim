import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_MapProperty from 'ol/MapProperty.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_MapProperty)".}
