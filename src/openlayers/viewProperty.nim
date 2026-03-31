import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olViewPropertyModule from 'ol/ViewProperty.js';".}
when defined(esmModules):
  {.emit: "import viewPropertyDefault from 'ol/ViewProperty.js';".}
proc getOlViewProperty*(): JsObject {.importjs: "(viewPropertyDefault)".}
