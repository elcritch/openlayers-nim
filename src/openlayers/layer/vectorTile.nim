import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_VectorTile from 'ol/layer/VectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_VectorTile)".}

type
  OlVectorTileLayer* = ref object of JsRoot
proc newOlVectorTileLayer*(options: JsObject = jsUndefined): OlVectorTileLayer {.importjs: "(new olNs_layer_VectorTile.default(#))".}
proc getFeaturesInExtent*(self: OlVectorTileLayer, extent: JsObject): JsObject {.importjs: "#.getFeaturesInExtent(#)".}
proc getRenderMode*(self: OlVectorTileLayer): JsObject {.importjs: "#.getRenderMode()".}
proc getPreload*(self: OlVectorTileLayer): float {.importjs: "#.getPreload()".}
proc getUseInterimTilesOnError*(self: OlVectorTileLayer): bool {.importjs: "#.getUseInterimTilesOnError()".}
proc setPreload*(self: OlVectorTileLayer, preload: float) {.importjs: "#.setPreload(#)".}
proc setUseInterimTilesOnError*(self: OlVectorTileLayer, useInterimTilesOnError: bool) {.importjs: "#.setUseInterimTilesOnError(#)".}
