import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_WMSCapabilities from 'ol/format/WMSCapabilities.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WMSCapabilities)".}

type
  WMSCapabilities* = ref object of JsRoot
proc newWMSCapabilities*(): WMSCapabilities {.importjs: "(new olNs_format_WMSCapabilities.default())".}
