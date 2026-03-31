import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_UTFGrid from 'ol/source/UTFGrid.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_UTFGrid)".}

type
  UTFGrid* = ref object of JsRoot
proc newUTFGrid*(options: JsObject): UTFGrid {.importjs: "(new olNs_source_UTFGrid.default(#))".}
proc getTemplate*(self: UTFGrid): cstring {.importjs: "#.getTemplate()".}
proc forDataAtCoordinateAndResolution*(self: UTFGrid, coordinate: JsObject, resolution: float, callback: JsObject, request: JsObject = jsUndefined) {.importjs: "#.forDataAtCoordinateAndResolution(#, #, #, #)".}
proc handleTileJSONError*(self: UTFGrid) {.importjs: "#.handleTileJSONError()".}
proc handleTileJSONResponse*(self: UTFGrid, tileJSON: JsObject) {.importjs: "#.handleTileJSONResponse(#)".}
