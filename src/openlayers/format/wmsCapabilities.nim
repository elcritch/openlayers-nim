import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WMSCapabilities from 'ol/format/WMSCapabilities.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WMSCapabilities)".}

type
  OlWMSCapabilities* = ref object of JsRoot
proc newOlWMSCapabilities*(): OlWMSCapabilities {.importjs: "(new olNs_format_WMSCapabilities.default())".}
