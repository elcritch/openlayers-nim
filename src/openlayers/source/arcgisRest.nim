import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_arcgisRest from 'ol/source/arcgisRest.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_arcgisRest)".}

proc getRequestUrl*(baseUrl: cstring, extent: JsObject, resolution: float, pixelRatio: float, projection: JsObject, params: JsObject): cstring {.importjs: "olNs_source_arcgisRest.getRequestUrl(#, #, #, #, #, #)".}
proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_arcgisRest.createLoader(#)".}

type
  LoaderOptions* = ref object of JsRoot

proc newLoaderOptions*(): LoaderOptions {.importjs: "({})".}
proc `crossOrigin=`*(options: LoaderOptions, value: cstring) {.importjs: "#.crossOrigin = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.referrerPolicy = #".}
proc `referrerPolicy=`*(options: LoaderOptions, value: cstring) {.importjs: "#.referrerPolicy = #".}
proc `hidpi=`*(options: LoaderOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `params=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.params = #".}
proc `projection=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `ratio=`*(options: LoaderOptions, value: float) {.importjs: "#.ratio = #".}
proc `url=`*(options: LoaderOptions, value: cstring) {.importjs: "#.url = #".}
proc `load=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.load = #".}
proc `load=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.load = #".}
