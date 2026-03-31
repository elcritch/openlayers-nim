import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_VectorTile from 'ol/layer/VectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_VectorTile)".}

type
  VectorTileLayer* = ref object of JsRoot
proc newVectorTileLayer*(options: JsObject = jsUndefined): VectorTileLayer {.importjs: "(new olNs_layer_VectorTile.default(#))".}
proc getFeaturesInExtent*(self: VectorTileLayer, extent: JsObject): JsObject {.importjs: "#.getFeaturesInExtent(#)".}
proc getRenderMode*(self: VectorTileLayer): JsObject {.importjs: "#.getRenderMode()".}
proc getPreload*(self: VectorTileLayer): float {.importjs: "#.getPreload()".}
proc getUseInterimTilesOnError*(self: VectorTileLayer): bool {.importjs: "#.getUseInterimTilesOnError()".}
proc setPreload*(self: VectorTileLayer, preload: float) {.importjs: "#.setPreload(#)".}
proc setUseInterimTilesOnError*(self: VectorTileLayer, useInterimTilesOnError: bool) {.importjs: "#.setUseInterimTilesOnError(#)".}
