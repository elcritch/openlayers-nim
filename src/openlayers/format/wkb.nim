import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WKB from 'ol/format/WKB.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WKB)".}

type
  OlWKB* = ref object of JsRoot
proc newOlWKB*(): OlWKB {.importjs: "(new olNs_format_WKB.default())".}
