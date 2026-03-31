import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_proj4 from 'ol/proj/proj4.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_proj4)".}

proc isRegistered*(): bool {.importjs: "olNs_proj_proj4.isRegistered()".}
proc unregister*() {.importjs: "olNs_proj_proj4.unregister()".}
proc register*(proj4: JsObject) {.importjs: "olNs_proj_proj4.register(#)".}
proc setProjectionCodeLookup*(funcVal: JsObject) {.importjs: "olNs_proj_proj4.setProjectionCodeLookup(#)".}
proc getProjectionCodeLookup*(): JsObject {.importjs: "olNs_proj_proj4.getProjectionCodeLookup()".}
proc fromProjectionCode*(code: cstring): JsObject {.importjs: "olNs_proj_proj4.fromProjectionCode(#)".}
proc setEPSGLookup*(funcVal: JsObject) {.importjs: "olNs_proj_proj4.setEPSGLookup(#)".}
proc getEPSGLookup*(): JsObject {.importjs: "olNs_proj_proj4.getEPSGLookup()".}
proc fromEPSGCode*(code: float | cstring): JsObject {.importjs: "olNs_proj_proj4.fromEPSGCode(#)".}
proc epsgLookupMapTiler*(key: cstring): JsObject {.importjs: "olNs_proj_proj4.epsgLookupMapTiler(#)".}
