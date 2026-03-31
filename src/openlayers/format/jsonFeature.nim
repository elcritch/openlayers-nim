import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_JSONFeature from 'ol/format/JSONFeature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_JSONFeature)".}

type
  JSONFeature* = ref object of JsRoot
proc newJSONFeature*(): JSONFeature {.importjs: "(new olNs_format_JSONFeature.default())".}
