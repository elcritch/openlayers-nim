import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_style_IconImageCache from 'ol/style/IconImageCache.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_IconImageCache)".}

type
  IconImageCache* = ref object of JsRoot
proc newIconImageCache*(): IconImageCache {.importjs: "(new olNs_style_IconImageCache.default())".}
proc clear*(self: IconImageCache) {.importjs: "#.clear()".}
proc canExpireCache*(self: IconImageCache): bool {.importjs: "#.canExpireCache()".}
proc expire*(self: IconImageCache) {.importjs: "#.expire()".}
proc get*(self: IconImageCache, src: cstring, color: JsObject): JsObject {.importjs: "#.get(#, #)".}
proc getPattern*(self: IconImageCache, src: cstring, color: JsObject): JsObject {.importjs: "#.getPattern(#, #)".}
proc set*(self: IconImageCache, src: cstring, color: JsObject, iconImage: JsObject, pattern: JsObject = jsUndefined) {.importjs: "#.set(#, #, #, #)".}
proc setSize*(self: IconImageCache, maxCacheSize: float) {.importjs: "#.setSize(#)".}

proc getCacheKey*(src: cstring, color: JsObject): cstring {.importjs: "olNs_style_IconImageCache.getCacheKey(#, #)".}

proc getShared*(): JsObject {.importjs: "(olNs_style_IconImageCache.shared)".}
