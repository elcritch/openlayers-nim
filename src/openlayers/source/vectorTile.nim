import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_VectorTile from 'ol/source/VectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_VectorTile)".}

type
  VectorTile* = ref object of JsRoot
proc newVectorTile*(options: JsObject): VectorTile {.importjs: "(new olNs_source_VectorTile.default(#))".}
proc getOverlaps*(self: VectorTile): bool {.importjs: "#.getOverlaps()".}
proc getSourceTiles*(self: VectorTile, pixelRatio: float, projection: JsObject, tile: JsObject): JsObject {.importjs: "#.getSourceTiles(#, #, #)".}
proc removeSourceTiles*(self: VectorTile, tile: JsObject) {.importjs: "#.removeSourceTiles(#)".}
proc setOverlaps*(self: VectorTile, overlaps: bool) {.importjs: "#.setOverlaps(#)".}

proc defaultLoadFunction*(tile: JsObject, url: cstring) {.importjs: "olNs_source_VectorTile.defaultLoadFunction(#, #)".}
