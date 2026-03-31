import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WKT from 'ol/format/WKT.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WKT)".}

type
  OlWKT* = ref object of JsRoot
proc newOlWKT*(options: JsObject = jsUndefined): OlWKT {.importjs: "(new olNs_format_WKT.default(#))".}
