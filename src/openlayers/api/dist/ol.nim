import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_dist_ol from 'ol/dist/ol.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_dist_ol)".}
