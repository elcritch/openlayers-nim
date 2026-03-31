import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_structs_LRUCache from 'ol/structs/LRUCache.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_structs_LRUCache)".}

type LRUCache* = ref object of JsRoot
proc newLRUCache*(
  highWaterMark: JsObject = jsUndefined
): LRUCache {.importjs: "(new olNs_structs_LRUCache.default(#))".}

proc deleteOldest*(self: LRUCache) {.importjs: "#.deleteOldest()".}
proc canExpireCache*(self: LRUCache): bool {.importjs: "#.canExpireCache()".}
proc expireCache*(
  self: LRUCache, keep: JsObject = jsUndefined
) {.importjs: "#.expireCache(#)".}

proc clear*(self: LRUCache) {.importjs: "#.clear()".}
proc containsKey*(self: LRUCache, key: cstring): bool {.importjs: "#.containsKey(#)".}
proc forEach*(self: LRUCache, f: JsObject) {.importjs: "#.forEach(#)".}
proc get*(
  self: LRUCache, key: cstring, options: JsObject = jsUndefined
): JsObject {.importjs: "#.get(#, #)".}

proc remove*(self: LRUCache, key: cstring): JsObject {.importjs: "#.remove(#)".}
proc getCount*(self: LRUCache): float {.importjs: "#.getCount()".}
proc getKeys*(self: LRUCache): seq[cstring] {.importjs: "#.getKeys()".}
proc getValues*(self: LRUCache): JsObject {.importjs: "#.getValues()".}
proc peekLast*(self: LRUCache): JsObject {.importjs: "#.peekLast()".}
proc peekLastKey*(self: LRUCache): cstring {.importjs: "#.peekLastKey()".}
proc peekFirstKey*(self: LRUCache): cstring {.importjs: "#.peekFirstKey()".}
proc peek*(self: LRUCache, key: cstring): JsObject {.importjs: "#.peek(#)".}
proc pop*(self: LRUCache): JsObject {.importjs: "#.pop()".}
proc replace*(
  self: LRUCache, key: cstring, value: JsObject
) {.importjs: "#.replace(#, #)".}

proc set*(self: LRUCache, key: cstring, value: JsObject) {.importjs: "#.set(#, #)".}
proc setSize*(self: LRUCache, size: float) {.importjs: "#.setSize(#)".}
