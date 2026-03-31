import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_BaseTileRepresentation from 'ol/webgl/BaseTileRepresentation.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_BaseTileRepresentation)".}

type
  OlBaseTileRepresentation* = ref object of JsRoot
proc newOlBaseTileRepresentation*(options: JsObject): OlBaseTileRepresentation {.importjs: "(new olNs_webgl_BaseTileRepresentation.default(#))".}
proc handleTileChange*(self: OlBaseTileRepresentation) {.importjs: "#.handleTileChange_()".}
proc setTile*(self: OlBaseTileRepresentation, tile: JsObject) {.importjs: "#.setTile(#)".}
proc uploadTile*(self: OlBaseTileRepresentation) {.importjs: "#.uploadTile()".}
proc setReady*(self: OlBaseTileRepresentation) {.importjs: "#.setReady()".}
proc setHelper*(self: OlBaseTileRepresentation, helper: JsObject) {.importjs: "#.setHelper(#)".}
