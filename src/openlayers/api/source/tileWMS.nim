import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileWMS from 'ol/source/TileWMS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileWMS)".}

type
  OlTileWMS* = ref object of JsRoot
proc newOlTileWMS*(options: JsObject = jsUndefined): OlTileWMS {.importjs: "(new olNs_source_TileWMS.default(#))".}
proc getFeatureInfoUrl*(self: OlTileWMS, coordinate: JsObject, resolution: float, projection: JsObject, params: JsObject): cstring {.importjs: "#.getFeatureInfoUrl(#, #, #, #)".}
proc getLegendUrl*(self: OlTileWMS, resolution: JsObject = jsUndefined, params: JsObject = jsUndefined): cstring {.importjs: "#.getLegendUrl(#, #)".}
proc getParams*(self: OlTileWMS): JsObject {.importjs: "#.getParams()".}
proc setParams*(self: OlTileWMS, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: OlTileWMS, params: JsObject) {.importjs: "#.updateParams(#)".}
