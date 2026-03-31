import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_SentinelHub from 'ol/source/SentinelHub.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_SentinelHub)".}

type
  OlSentinelHub* = ref object of JsRoot
proc newOlSentinelHub*(options: JsObject = jsUndefined): OlSentinelHub {.importjs: "(new olNs_source_SentinelHub.default(#))".}
proc setAuth*(self: OlSentinelHub, auth: JsObject): JsObject {.importjs: "#.setAuth(#)".}
proc setData*(self: OlSentinelHub, data: JsObject) {.importjs: "#.setData(#)".}
proc setEvalscript*(self: OlSentinelHub, evalscript: JsObject) {.importjs: "#.setEvalscript(#)".}
proc fireWhenReady*(self: OlSentinelHub) {.importjs: "#.fireWhenReady_()".}
proc getKeyForConfig*(self: OlSentinelHub): cstring {.importjs: "#.getKeyForConfig_()".}
proc getError*(self: OlSentinelHub): JsObject {.importjs: "#.getError()".}

proc parseTokenClaims*(token: cstring): JsObject {.importjs: "olNs_source_SentinelHub.parseTokenClaims(#)".}
proc getProjectionIdentifier*(projection: JsObject): cstring {.importjs: "olNs_source_SentinelHub.getProjectionIdentifier(#)".}
proc serializeFunction*(name: cstring, funcVal: JsObject): cstring {.importjs: "olNs_source_SentinelHub.serializeFunction(#, #)".}
