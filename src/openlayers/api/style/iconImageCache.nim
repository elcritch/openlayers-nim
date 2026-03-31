import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_IconImageCache from 'ol/style/IconImageCache.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_IconImageCache)".}

type
  OlIconImageCache* = ref object of JsRoot
proc newOlIconImageCache*(): OlIconImageCache {.importjs: "(new olNs_style_IconImageCache.default())".}
proc clear*(self: OlIconImageCache) {.importjs: "#.clear()".}
proc canExpireCache*(self: OlIconImageCache): bool {.importjs: "#.canExpireCache()".}
proc expire*(self: OlIconImageCache) {.importjs: "#.expire()".}
proc get*(self: OlIconImageCache, src: cstring, color: JsObject): JsObject {.importjs: "#.get(#, #)".}
proc getPattern*(self: OlIconImageCache, src: cstring, color: JsObject): JsObject {.importjs: "#.getPattern(#, #)".}
proc set*(self: OlIconImageCache, src: cstring, color: JsObject, iconImage: JsObject, pattern: JsObject = jsUndefined) {.importjs: "#.set(#, #, #, #)".}
proc setSize*(self: OlIconImageCache, maxCacheSize: float) {.importjs: "#.setSize(#)".}

proc getCacheKey*(src: cstring, color: JsObject): cstring {.importjs: "olNs_style_IconImageCache.getCacheKey(#, #)".}

proc getShared*(): JsObject {.importjs: "(olNs_style_IconImageCache.shared)".}
