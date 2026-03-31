import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WMSGetFeatureInfo from 'ol/format/WMSGetFeatureInfo.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WMSGetFeatureInfo)".}

type
  WMSGetFeatureInfo* = ref object of JsRoot
proc newWMSGetFeatureInfo*(options: JsObject = jsUndefined): WMSGetFeatureInfo {.importjs: "(new olNs_format_WMSGetFeatureInfo.default(#))".}
proc getLayers*(self: WMSGetFeatureInfo): JsObject {.importjs: "#.getLayers()".}
proc setLayers*(self: WMSGetFeatureInfo, layers: JsObject) {.importjs: "#.setLayers(#)".}
