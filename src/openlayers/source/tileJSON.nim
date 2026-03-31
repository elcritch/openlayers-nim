import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileJSON from 'ol/source/TileJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileJSON)".}

type
  OlTileJSON* = ref object of JsRoot
proc newOlTileJSON*(options: JsObject): OlTileJSON {.importjs: "(new olNs_source_TileJSON.default(#))".}
proc getTileJSON*(self: OlTileJSON): JsObject {.importjs: "#.getTileJSON()".}
proc handleTileJSONResponse*(self: OlTileJSON, tileJSON: JsObject) {.importjs: "#.handleTileJSONResponse(#)".}
proc handleTileJSONError*(self: OlTileJSON) {.importjs: "#.handleTileJSONError()".}
