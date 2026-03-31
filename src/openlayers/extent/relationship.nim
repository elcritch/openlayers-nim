import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_extent_Relationship from 'ol/extent/Relationship.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_extent_Relationship)".}
