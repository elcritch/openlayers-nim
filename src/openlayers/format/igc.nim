import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_IGC from 'ol/format/IGC.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_IGC)".}

type
  IGC* = ref object of JsRoot
proc newIGC*(options: JsObject = jsUndefined): IGC {.importjs: "(new olNs_format_IGC.default(#))".}
