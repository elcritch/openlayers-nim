import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_utm from 'ol/proj/utm.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_utm)".}

proc zoneFromCode*(code: cstring): JsObject {.importjs: "olNs_proj_utm.zoneFromCode(#)".}
proc makeProjection*(code: cstring): JsObject {.importjs: "olNs_proj_utm.makeProjection(#)".}
proc makeTransforms*(projection: JsObject): JsObject {.importjs: "olNs_proj_utm.makeTransforms(#)".}
