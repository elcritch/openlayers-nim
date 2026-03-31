import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_mapserver from 'ol/source/mapserver.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_mapserver)".}

proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_mapserver.createLoader(#)".}

type
  LoaderOptions* = ref object of JsRoot

proc newLoaderOptions*(): LoaderOptions {.importjs: "({})".}
proc `url=`*(options: LoaderOptions, value: cstring) {.importjs: "#.url = #".}
proc `crossOrigin=`*(options: LoaderOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `ratio=`*(options: LoaderOptions, value: float) {.importjs: "#.ratio = #".}
proc `params=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.params = #".}
proc `load=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.load = #".}
proc `load=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.load = #".}
