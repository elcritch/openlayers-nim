import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_IIIFInfo from 'ol/format/IIIFInfo.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_IIIFInfo)".}

type
  OlIIIFInfo* = ref object of JsRoot
proc newOlIIIFInfo*(imageInfo: JsObject): OlIIIFInfo {.importjs: "(new olNs_format_IIIFInfo.default(#))".}
proc setImageInfo*(self: OlIIIFInfo, imageInfo: JsObject) {.importjs: "#.setImageInfo(#)".}
proc getImageApiVersion*(self: OlIIIFInfo): JsObject {.importjs: "#.getImageApiVersion()".}
proc getComplianceLevelEntryFromProfile*(self: OlIIIFInfo, version: JsObject): cstring {.importjs: "#.getComplianceLevelEntryFromProfile(#)".}
proc getComplianceLevelFromProfile*(self: OlIIIFInfo, version: JsObject): cstring {.importjs: "#.getComplianceLevelFromProfile(#)".}
proc getComplianceLevelSupportedFeatures*(self: OlIIIFInfo): JsObject {.importjs: "#.getComplianceLevelSupportedFeatures()".}
proc getTileSourceOptions*(self: OlIIIFInfo, preferredOptions: JsObject = jsUndefined): JsObject {.importjs: "#.getTileSourceOptions(#)".}
