import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_UTFGrid from 'ol/source/UTFGrid.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_UTFGrid)".}

type
  OlUTFGrid* = ref object of JsRoot
proc newOlUTFGrid*(options: JsObject): OlUTFGrid {.importjs: "(new olNs_source_UTFGrid.default(#))".}
proc getTemplate*(self: OlUTFGrid): cstring {.importjs: "#.getTemplate()".}
proc forDataAtCoordinateAndResolution*(self: OlUTFGrid, coordinate: JsObject, resolution: float, callback: JsObject, request: JsObject = jsUndefined) {.importjs: "#.forDataAtCoordinateAndResolution(#, #, #, #)".}
proc handleTileJSONError*(self: OlUTFGrid) {.importjs: "#.handleTileJSONError()".}
proc handleTileJSONResponse*(self: OlUTFGrid, tileJSON: JsObject) {.importjs: "#.handleTileJSONResponse(#)".}
