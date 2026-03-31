import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_SentinelHub from 'ol/source/SentinelHub.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_SentinelHub)".}

type
  SentinelHub* = ref object of JsRoot
proc newSentinelHub*(options: JsObject = jsUndefined): SentinelHub {.importjs: "(new olNs_source_SentinelHub.default(#))".}
proc setAuth*(self: SentinelHub, auth: JsObject): JsObject {.importjs: "#.setAuth(#)".}
proc setData*(self: SentinelHub, data: JsObject) {.importjs: "#.setData(#)".}
proc setEvalscript*(self: SentinelHub, evalscript: JsObject) {.importjs: "#.setEvalscript(#)".}
proc fireWhenReady*(self: SentinelHub) {.importjs: "#.fireWhenReady_()".}
proc getKeyForConfig*(self: SentinelHub): cstring {.importjs: "#.getKeyForConfig_()".}
proc getError*(self: SentinelHub): JsObject {.importjs: "#.getError()".}

proc parseTokenClaims*(token: cstring): JsObject {.importjs: "olNs_source_SentinelHub.parseTokenClaims(#)".}
proc getProjectionIdentifier*(projection: JsObject): cstring {.importjs: "olNs_source_SentinelHub.getProjectionIdentifier(#)".}
proc serializeFunction*(name: cstring, funcVal: JsObject): cstring {.importjs: "olNs_source_SentinelHub.serializeFunction(#, #)".}
