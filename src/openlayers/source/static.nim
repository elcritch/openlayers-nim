import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_static from 'ol/source/static.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_static)".}

proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_static.createLoader(#)".}

type
  LoaderOptions* = ref object of JsRoot

proc newLoaderOptions*(): LoaderOptions {.importjs: "({})".}
proc `crossOrigin=`*(options: LoaderOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `imageExtent=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.imageExtent = #".}
proc `imageExtent=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.imageExtent = #".}
proc `url=`*(options: LoaderOptions, value: cstring) {.importjs: "#.url = #".}
proc `load=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.load = #".}
proc `load=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.load = #".}
