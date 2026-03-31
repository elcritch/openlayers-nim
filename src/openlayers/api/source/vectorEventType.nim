import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_VectorEventType from 'ol/source/VectorEventType.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_VectorEventType)".}
