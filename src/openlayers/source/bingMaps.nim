import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_BingMaps from 'ol/source/BingMaps.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_BingMaps)".}

type
  OlBingMaps* = ref object of JsRoot
proc newOlBingMaps*(options: JsObject): OlBingMaps {.importjs: "(new olNs_source_BingMaps.default(#))".}
proc getApiKey*(self: OlBingMaps): cstring {.importjs: "#.getApiKey()".}
proc getImagerySet*(self: OlBingMaps): cstring {.importjs: "#.getImagerySet()".}
proc handleImageryMetadataResponse*(self: OlBingMaps, response: JsObject) {.importjs: "#.handleImageryMetadataResponse(#)".}

proc quadKey*(tileCoord: JsObject): cstring {.importjs: "olNs_source_BingMaps.quadKey(#)".}
