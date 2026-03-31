import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GML32 from 'ol/format/GML32.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GML32)".}

type GML32* = ref object of JsRoot
proc newGML32*(): GML32 {.importjs: "(new olNs_format_GML32.default())".}
