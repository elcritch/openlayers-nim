import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Tile from 'ol/Tile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Tile)".}

type
  OlTile* = ref object of JsRoot
proc newOlTile*(tileCoord: JsObject, state: JsObject, options: JsObject = jsUndefined): OlTile {.importjs: "(new olNs_Tile.default(#, #, #))".}
proc changed*(self: OlTile) {.importjs: "#.changed()".}
proc release*(self: OlTile) {.importjs: "#.release()".}
proc getKey*(self: OlTile): cstring {.importjs: "#.getKey()".}
proc getTileCoord*(self: OlTile): JsObject {.importjs: "#.getTileCoord()".}
proc getState*(self: OlTile): JsObject {.importjs: "#.getState()".}
proc setState*(self: OlTile, state: JsObject) {.importjs: "#.setState(#)".}
proc load*(self: OlTile) {.importjs: "#.load()".}
proc getAlpha*(self: OlTile, id: cstring, time: float): float {.importjs: "#.getAlpha(#, #)".}
proc inTransition*(self: OlTile, id: cstring): bool {.importjs: "#.inTransition(#)".}
proc endTransition*(self: OlTile, id: cstring) {.importjs: "#.endTransition(#)".}
