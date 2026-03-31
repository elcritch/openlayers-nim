import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_WMTS from 'ol/source/WMTS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_WMTS)".}

type
  WMTS* = ref object of JsRoot
proc newWMTS*(options: JsObject): WMTS {.importjs: "(new olNs_source_WMTS.default(#))".}
proc getDimensions*(self: WMTS): JsObject {.importjs: "#.getDimensions()".}
proc getFormat*(self: WMTS): cstring {.importjs: "#.getFormat()".}
proc getLayer*(self: WMTS): cstring {.importjs: "#.getLayer()".}
proc getMatrixSet*(self: WMTS): cstring {.importjs: "#.getMatrixSet()".}
proc getRequestEncoding*(self: WMTS): JsObject {.importjs: "#.getRequestEncoding()".}
proc getStyle*(self: WMTS): cstring {.importjs: "#.getStyle()".}
proc getVersion*(self: WMTS): cstring {.importjs: "#.getVersion()".}
proc updateDimensions*(self: WMTS, dimensions: JsObject) {.importjs: "#.updateDimensions(#)".}
proc createFromWMTSTemplate*(self: WMTS, templateVal: cstring): JsObject {.importjs: "#.createFromWMTSTemplate(#)".}

proc optionsFromCapabilities*(wmtsCap: JsObject, config: JsObject): JsObject {.importjs: "olNs_source_WMTS.optionsFromCapabilities(#, #)".}
