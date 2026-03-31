import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_WMTS from 'ol/source/WMTS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_WMTS)".}

type
  OlWMTS* = ref object of JsRoot
proc newOlWMTS*(options: JsObject): OlWMTS {.importjs: "(new olNs_source_WMTS.default(#))".}
proc getDimensions*(self: OlWMTS): JsObject {.importjs: "#.getDimensions()".}
proc getFormat*(self: OlWMTS): cstring {.importjs: "#.getFormat()".}
proc getLayer*(self: OlWMTS): cstring {.importjs: "#.getLayer()".}
proc getMatrixSet*(self: OlWMTS): cstring {.importjs: "#.getMatrixSet()".}
proc getRequestEncoding*(self: OlWMTS): JsObject {.importjs: "#.getRequestEncoding()".}
proc getStyle*(self: OlWMTS): cstring {.importjs: "#.getStyle()".}
proc getVersion*(self: OlWMTS): cstring {.importjs: "#.getVersion()".}
proc updateDimensions*(self: OlWMTS, dimensions: JsObject) {.importjs: "#.updateDimensions(#)".}
proc createFromWMTSTemplate*(self: OlWMTS, templateVal: cstring): JsObject {.importjs: "#.createFromWMTSTemplate(#)".}

proc optionsFromCapabilities*(wmtsCap: JsObject, config: JsObject): JsObject {.importjs: "olNs_source_WMTS.optionsFromCapabilities(#, #)".}
