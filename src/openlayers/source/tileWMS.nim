import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileWMS from 'ol/source/TileWMS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileWMS)".}

type
  TileWMS* = ref object of JsRoot
proc newTileWMS*(options: JsObject = jsUndefined): TileWMS {.importjs: "(new olNs_source_TileWMS.default(#))".}
proc getFeatureInfoUrl*(self: TileWMS, coordinate: JsObject, resolution: float, projection: JsObject, params: JsObject): cstring {.importjs: "#.getFeatureInfoUrl(#, #, #, #)".}
proc getLegendUrl*(self: TileWMS, resolution: JsObject = jsUndefined, params: JsObject = jsUndefined): cstring {.importjs: "#.getLegendUrl(#, #)".}
proc getParams*(self: TileWMS): JsObject {.importjs: "#.getParams()".}
proc setParams*(self: TileWMS, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: TileWMS, params: JsObject) {.importjs: "#.updateParams(#)".}
