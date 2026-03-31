import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WMTSCapabilities from 'ol/format/WMTSCapabilities.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WMTSCapabilities)".}

type
  OlWMTSCapabilities* = ref object of JsRoot
proc newOlWMTSCapabilities*(): OlWMTSCapabilities {.importjs: "(new olNs_format_WMTSCapabilities.default())".}
