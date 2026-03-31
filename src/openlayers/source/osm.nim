import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OSM from 'ol/source/OSM.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OSM)".}

type
  OlOSMOptions* = ref object of JsRoot
  OlOSM* = ref object of JsRoot

proc newOlOSMOptions*(): OlOSMOptions {.importjs: "({})".}
proc `attributions=`*(
  options: OlOSMOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `cacheSize=`*(options: OlOSMOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(
  options: OlOSMOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `crossOrigin=`*(
  options: OlOSMOptions, value: JsObject
) {.importjs: "#.crossOrigin = #".}

proc `referrerPolicy=`*(
  options: OlOSMOptions, value: cstring
) {.importjs: "#.referrerPolicy = #".}

proc `interpolate=`*(
  options: OlOSMOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `maxZoom=`*(options: OlOSMOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `reprojectionErrorThreshold=`*(
  options: OlOSMOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `tileLoadFunction=`*(
  options: OlOSMOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `transition=`*(
  options: OlOSMOptions, value: float
) {.importjs: "#.transition = #".}

proc `url=`*(options: OlOSMOptions, value: cstring) {.importjs: "#.url = #".}
proc `wrapX=`*(options: OlOSMOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `zDirection=`*(
  options: OlOSMOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: OlOSMOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc newOlOSM*(
  options: JsObject = jsUndefined
): OlOSM {.importjs: "(new olNs_source_OSM.default(#))".}

proc newOlOSM*(
  options: OlOSMOptions
): OlOSM {.importjs: "(new olNs_source_OSM.default(#))".}

proc getATTRIBUTION*(): cstring {.importjs: "(olNs_source_OSM.ATTRIBUTION)".}
