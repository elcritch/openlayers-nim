import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_projections from 'ol/proj/projections.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_projections)".}

proc clear*() {.importjs: "olNs_proj_projections.clear()".}
proc get*(code: cstring): JsObject {.importjs: "olNs_proj_projections.get(#)".}
proc add*(code: cstring, projection: JsObject) {.importjs: "olNs_proj_projections.add(#, #)".}
