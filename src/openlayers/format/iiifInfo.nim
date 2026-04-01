import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_IIIFInfo from 'ol/format/IIIFInfo.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_IIIFInfo)".}

type
  IIIFInfo* = ref object of JsRoot
proc newIIIFInfo*(imageInfo: JsObject): IIIFInfo {.importjs: "(new olNs_format_IIIFInfo.default(#))".}
proc setImageInfo*(self: IIIFInfo, imageInfo: JsObject) {.importjs: "#.setImageInfo(#)".}
proc getImageApiVersion*(self: IIIFInfo): JsObject {.importjs: "#.getImageApiVersion()".}
proc getComplianceLevelEntryFromProfile*(self: IIIFInfo, version: JsObject): cstring {.importjs: "#.getComplianceLevelEntryFromProfile(#)".}
proc getComplianceLevelFromProfile*(self: IIIFInfo, version: JsObject): cstring {.importjs: "#.getComplianceLevelFromProfile(#)".}
proc getComplianceLevelSupportedFeatures*(self: IIIFInfo): JsObject {.importjs: "#.getComplianceLevelSupportedFeatures()".}
proc getTileSourceOptions*(self: IIIFInfo, preferredOptions: JsObject = jsUndefined): JsObject {.importjs: "#.getTileSourceOptions(#)".}

type
  PreferredOptions* = ref object of JsRoot

proc newPreferredOptions*(): PreferredOptions {.importjs: "({})".}
proc `format=`*(options: PreferredOptions, value: cstring) {.importjs: "#.format = #".}
proc `quality=`*(options: PreferredOptions, value: cstring) {.importjs: "#.quality = #".}
