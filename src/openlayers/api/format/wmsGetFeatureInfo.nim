import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WMSGetFeatureInfo from 'ol/format/WMSGetFeatureInfo.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WMSGetFeatureInfo)".}

type
  OlWMSGetFeatureInfo* = ref object of JsRoot
proc newOlWMSGetFeatureInfo*(options: JsObject = jsUndefined): OlWMSGetFeatureInfo {.importjs: "(new olNs_format_WMSGetFeatureInfo.default(#))".}
proc getLayers*(self: OlWMSGetFeatureInfo): JsObject {.importjs: "#.getLayers()".}
proc setLayers*(self: OlWMSGetFeatureInfo, layers: JsObject) {.importjs: "#.setLayers(#)".}
