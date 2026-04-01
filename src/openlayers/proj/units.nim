import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_proj_Units from 'ol/proj/Units.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_Units)".}

proc fromCode*(code: float): JsObject {.importjs: "olNs_proj_Units.fromCode(#)".}

proc getMETERS_PER_UNIT*(): JsObject {.importjs: "(olNs_proj_Units.METERS_PER_UNIT)".}
