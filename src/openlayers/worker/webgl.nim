import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_worker_webgl from 'ol/worker/webgl.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_worker_webgl)".}

proc create*(): JsObject {.importjs: "olNs_worker_webgl.create()".}
