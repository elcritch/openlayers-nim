import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_VectorRenderTile from 'ol/VectorRenderTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_VectorRenderTile)".}

type
  OlVectorRenderTile* = ref object of JsRoot
proc newOlVectorRenderTile*(tileCoord: JsObject, state: JsObject, urlTileCoord: JsObject, getSourceTiles: JsObject, removeSourceTiles: JsObject): OlVectorRenderTile {.importjs: "(new olNs_VectorRenderTile.default(#, #, #, #, #))".}
proc getContext*(self: OlVectorRenderTile): JsObject {.importjs: "#.getContext()".}
proc hasContext*(self: OlVectorRenderTile): bool {.importjs: "#.hasContext()".}
proc getImage*(self: OlVectorRenderTile): JsObject {.importjs: "#.getImage()".}
proc getReplayState*(self: OlVectorRenderTile, layer: JsObject): JsObject {.importjs: "#.getReplayState(#)".}
