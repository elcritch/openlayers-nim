import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_resolution from 'ol/resolution.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_resolution)".}

proc fromResolutionLike*(resolution: JsObject): float {.importjs: "olNs_resolution.fromResolutionLike(#)".}
