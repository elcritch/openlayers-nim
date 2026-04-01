import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
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

type
  SentinelHubOptions* = ref object of JsRoot

proc newSentinelHubOptions*(): SentinelHubOptions {.importjs: "({})".}
proc `auth=`*(options: SentinelHubOptions, value: cstring) {.importjs: "#.auth = #".}
proc `auth=`*(options: SentinelHubOptions, value: JsObject) {.importjs: "#.auth = #".}
proc `auth=`*(options: SentinelHubOptions, value: RootRef) {.importjs: "#.auth = #".}
proc `data=`*(options: SentinelHubOptions, value: JsObject) {.importjs: "#.data = #".}
proc `data=`*(options: SentinelHubOptions, value: RootRef) {.importjs: "#.data = #".}
proc `data=`*[T](options: SentinelHubOptions, value: seq[T]) {.importjs: "#.data = #".}
proc `evalscript=`*(options: SentinelHubOptions, value: cstring) {.importjs: "#.evalscript = #".}
proc `evalscript=`*(options: SentinelHubOptions, value: JsObject) {.importjs: "#.evalscript = #".}
proc `evalscript=`*(options: SentinelHubOptions, value: RootRef) {.importjs: "#.evalscript = #".}
proc `tileSize=`*(options: SentinelHubOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: SentinelHubOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: SentinelHubOptions, value: RootRef) {.importjs: "#.tileSize = #".}
proc `url=`*(options: SentinelHubOptions, value: cstring) {.importjs: "#.url = #".}
proc `projection=`*(options: SentinelHubOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: SentinelHubOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `attributionsCollapsible=`*(options: SentinelHubOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `interpolate=`*(options: SentinelHubOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `wrapX=`*(options: SentinelHubOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: SentinelHubOptions, value: float) {.importjs: "#.transition = #".}

proc newSentinelHub*(options: SentinelHubOptions): SentinelHub {.importjs: "(new olNs_source_SentinelHub.default(#))".}
