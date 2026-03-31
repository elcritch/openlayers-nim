import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GML from 'ol/format/GML.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GML)".}
