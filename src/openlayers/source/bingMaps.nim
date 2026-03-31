import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_BingMaps from 'ol/source/BingMaps.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_BingMaps)".}

type
  BingMaps* = ref object of JsRoot
proc newBingMaps*(options: JsObject): BingMaps {.importjs: "(new olNs_source_BingMaps.default(#))".}
proc getApiKey*(self: BingMaps): cstring {.importjs: "#.getApiKey()".}
proc getImagerySet*(self: BingMaps): cstring {.importjs: "#.getImagerySet()".}
proc handleImageryMetadataResponse*(self: BingMaps, response: JsObject) {.importjs: "#.handleImageryMetadataResponse(#)".}

proc quadKey*(tileCoord: JsObject): cstring {.importjs: "olNs_source_BingMaps.quadKey(#)".}
