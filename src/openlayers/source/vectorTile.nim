import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_VectorTile from 'ol/source/VectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_VectorTile)".}

type
  OlVectorTile* = ref object of JsRoot
proc newOlVectorTile*(options: JsObject): OlVectorTile {.importjs: "(new olNs_source_VectorTile.default(#))".}
proc getOverlaps*(self: OlVectorTile): bool {.importjs: "#.getOverlaps()".}
proc getSourceTiles*(self: OlVectorTile, pixelRatio: float, projection: JsObject, tile: JsObject): JsObject {.importjs: "#.getSourceTiles(#, #, #)".}
proc removeSourceTiles*(self: OlVectorTile, tile: JsObject) {.importjs: "#.removeSourceTiles(#)".}
proc setOverlaps*(self: OlVectorTile, overlaps: bool) {.importjs: "#.setOverlaps(#)".}

proc defaultLoadFunction*(tile: JsObject, url: cstring) {.importjs: "olNs_source_VectorTile.defaultLoadFunction(#, #)".}
