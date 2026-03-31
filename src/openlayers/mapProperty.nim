import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olMapPropertyModule from 'ol/MapProperty.js';".}
when defined(esmModules):
  {.emit: "import mapPropertyDefault from 'ol/MapProperty.js';".}
proc getOlMapProperty*(): JsObject {.importjs: "(mapPropertyDefault)".}
