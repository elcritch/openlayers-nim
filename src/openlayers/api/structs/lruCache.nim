import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_structs_LRUCache from 'ol/structs/LRUCache.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_structs_LRUCache)".}

type
  OlLRUCache* = ref object of JsRoot
proc newOlLRUCache*(highWaterMark: JsObject = jsUndefined): OlLRUCache {.importjs: "(new olNs_structs_LRUCache.default(#))".}
proc deleteOldest*(self: OlLRUCache) {.importjs: "#.deleteOldest()".}
proc canExpireCache*(self: OlLRUCache): bool {.importjs: "#.canExpireCache()".}
proc expireCache*(self: OlLRUCache, keep: JsObject = jsUndefined) {.importjs: "#.expireCache(#)".}
proc clear*(self: OlLRUCache) {.importjs: "#.clear()".}
proc containsKey*(self: OlLRUCache, key: cstring): bool {.importjs: "#.containsKey(#)".}
proc forEach*(self: OlLRUCache, f: JsObject) {.importjs: "#.forEach(#)".}
proc get*(self: OlLRUCache, key: cstring, options: JsObject = jsUndefined): JsObject {.importjs: "#.get(#, #)".}
proc remove*(self: OlLRUCache, key: cstring): JsObject {.importjs: "#.remove(#)".}
proc getCount*(self: OlLRUCache): float {.importjs: "#.getCount()".}
proc getKeys*(self: OlLRUCache): seq[cstring] {.importjs: "#.getKeys()".}
proc getValues*(self: OlLRUCache): JsObject {.importjs: "#.getValues()".}
proc peekLast*(self: OlLRUCache): JsObject {.importjs: "#.peekLast()".}
proc peekLastKey*(self: OlLRUCache): cstring {.importjs: "#.peekLastKey()".}
proc peekFirstKey*(self: OlLRUCache): cstring {.importjs: "#.peekFirstKey()".}
proc peek*(self: OlLRUCache, key: cstring): JsObject {.importjs: "#.peek(#)".}
proc pop*(self: OlLRUCache): JsObject {.importjs: "#.pop()".}
proc replace*(self: OlLRUCache, key: cstring, value: JsObject) {.importjs: "#.replace(#, #)".}
proc set*(self: OlLRUCache, key: cstring, value: JsObject) {.importjs: "#.set(#, #)".}
proc setSize*(self: OlLRUCache, size: float) {.importjs: "#.setSize(#)".}
