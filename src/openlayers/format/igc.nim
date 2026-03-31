import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_IGC from 'ol/format/IGC.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_IGC)".}

type
  OlIGC* = ref object of JsRoot
proc newOlIGC*(options: JsObject = jsUndefined): OlIGC {.importjs: "(new olNs_format_IGC.default(#))".}
