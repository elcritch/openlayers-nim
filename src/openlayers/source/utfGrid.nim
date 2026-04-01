import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_UTFGrid from 'ol/source/UTFGrid.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_UTFGrid)".}

type
  UTFGrid* = ref object of JsRoot
proc newUTFGrid*(options: JsObject): UTFGrid {.importjs: "(new olNs_source_UTFGrid.default(#))".}
proc getTemplate*(self: UTFGrid): cstring {.importjs: "#.getTemplate()".}
proc forDataAtCoordinateAndResolution*(self: UTFGrid, coordinate: JsObject, resolution: float, callback: JsObject, request: JsObject = jsUndefined) {.importjs: "#.forDataAtCoordinateAndResolution(#, #, #, #)".}
proc handleTileJSONError*(self: UTFGrid) {.importjs: "#.handleTileJSONError()".}
proc handleTileJSONResponse*(self: UTFGrid, tileJSON: JsObject) {.importjs: "#.handleTileJSONResponse(#)".}

type
  UTFGridOptions* = ref object of JsRoot

proc newUTFGridOptions*(): UTFGridOptions {.importjs: "({})".}
proc `preemptive=`*(options: UTFGridOptions, value: bool) {.importjs: "#.preemptive = #".}
proc `jsonp=`*(options: UTFGridOptions, value: bool) {.importjs: "#.jsonp = #".}
proc `tileJSON=`*(options: UTFGridOptions, value: JsObject) {.importjs: "#.tileJSON = #".}
proc `tileJSON=`*(options: UTFGridOptions, value: RootRef) {.importjs: "#.tileJSON = #".}
proc `url=`*(options: UTFGridOptions, value: cstring) {.importjs: "#.url = #".}
proc `wrapX=`*(options: UTFGridOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `zDirection=`*(options: UTFGridOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: UTFGridOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: UTFGridOptions, value: RootRef) {.importjs: "#.zDirection = #".}

proc newUTFGrid*(options: UTFGridOptions): UTFGrid {.importjs: "(new olNs_source_UTFGrid.default(#))".}
