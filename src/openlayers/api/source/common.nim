import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_common from 'ol/source/common.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_common)".}

proc getDEFAULT_WMS_VERSION*(): cstring {.importjs: "(olNs_source_common.DEFAULT_WMS_VERSION)".}
proc getDECIMALS*(): float {.importjs: "(olNs_source_common.DECIMALS)".}
