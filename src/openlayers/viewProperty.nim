import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_ViewProperty from 'ol/ViewProperty.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_ViewProperty)".}
