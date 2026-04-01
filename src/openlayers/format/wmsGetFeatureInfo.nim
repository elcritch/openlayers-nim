import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_WMSGetFeatureInfo from 'ol/format/WMSGetFeatureInfo.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WMSGetFeatureInfo)".}

type
  WMSGetFeatureInfo* = ref object of JsRoot
proc newWMSGetFeatureInfo*(options: JsObject = jsUndefined): WMSGetFeatureInfo {.importjs: "(new olNs_format_WMSGetFeatureInfo.default(#))".}
proc getLayers*(self: WMSGetFeatureInfo): JsObject {.importjs: "#.getLayers()".}
proc setLayers*(self: WMSGetFeatureInfo, layers: JsObject) {.importjs: "#.setLayers(#)".}

type
  WMSGetFeatureInfoOptions* = ref object of JsRoot

proc newWMSGetFeatureInfoOptions*(): WMSGetFeatureInfoOptions {.importjs: "({})".}
proc `layers=`*(options: WMSGetFeatureInfoOptions, value: seq[cstring]) {.importjs: "#.layers = #".}

proc newWMSGetFeatureInfo*(options: WMSGetFeatureInfoOptions): WMSGetFeatureInfo {.importjs: "(new olNs_format_WMSGetFeatureInfo.default(#))".}
