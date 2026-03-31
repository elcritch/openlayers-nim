import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileArcGISRest from 'ol/source/TileArcGISRest.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileArcGISRest)".}

type
  TileArcGISRest* = ref object of JsRoot
proc newTileArcGISRest*(options: JsObject = jsUndefined): TileArcGISRest {.importjs: "(new olNs_source_TileArcGISRest.default(#))".}
proc getParams*(self: TileArcGISRest): JsObject {.importjs: "#.getParams()".}
proc setParams*(self: TileArcGISRest, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: TileArcGISRest, params: JsObject) {.importjs: "#.updateParams(#)".}
