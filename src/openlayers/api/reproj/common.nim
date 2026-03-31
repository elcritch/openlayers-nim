import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_reproj_common from 'ol/reproj/common.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_reproj_common)".}

proc getERROR_THRESHOLD*(): float {.importjs: "(olNs_reproj_common.ERROR_THRESHOLD)".}
