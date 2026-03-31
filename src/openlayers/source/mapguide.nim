import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_mapguide from 'ol/source/mapguide.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_mapguide)".}

proc createLoader*(
  options: JsObject
): JsObject {.importjs: "olNs_source_mapguide.createLoader(#)".}

type LoaderOptions* = ref object of JsRoot

proc newLoaderOptions*(): LoaderOptions {.importjs: "({})".}
proc `url=`*(options: LoaderOptions, value: cstring) {.importjs: "#.url = #".}
proc `crossOrigin=`*(
  options: LoaderOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `referrerPolicy=`*(
  options: LoaderOptions, value: JsObject
) {.importjs: "#.referrerPolicy = #".}

proc `referrerPolicy=`*(
  options: LoaderOptions, value: RootRef
) {.importjs: "#.referrerPolicy = #".}

proc `displayDpi=`*(
  options: LoaderOptions, value: float
) {.importjs: "#.displayDpi = #".}

proc `metersPerUnit=`*(
  options: LoaderOptions, value: float
) {.importjs: "#.metersPerUnit = #".}

proc `hidpi=`*(options: LoaderOptions, value: bool) {.importjs: "#.hidpi = #".}
proc `useOverlay=`*(
  options: LoaderOptions, value: bool
) {.importjs: "#.useOverlay = #".}

proc `ratio=`*(options: LoaderOptions, value: float) {.importjs: "#.ratio = #".}
proc `params=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.params = #".}
proc `load=`*(options: LoaderOptions, value: JsObject) {.importjs: "#.load = #".}
proc `load=`*(options: LoaderOptions, value: RootRef) {.importjs: "#.load = #".}
