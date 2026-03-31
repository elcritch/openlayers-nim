import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileArcGISRest from 'ol/source/TileArcGISRest.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileArcGISRest)".}

type
  OlTileArcGISRest* = ref object of JsRoot
proc newOlTileArcGISRest*(options: JsObject = jsUndefined): OlTileArcGISRest {.importjs: "(new olNs_source_TileArcGISRest.default(#))".}
proc getParams*(self: OlTileArcGISRest): JsObject {.importjs: "#.getParams()".}
proc setParams*(self: OlTileArcGISRest, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: OlTileArcGISRest, params: JsObject) {.importjs: "#.updateParams(#)".}
