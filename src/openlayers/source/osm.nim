import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OSM from 'ol/source/OSM.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OSM)".}

type
  OSMOptions* = ref object of JsRoot
  OSM* = ref object of JsRoot

proc newOSMOptions*(): OSMOptions {.importjs: "({})".}
proc `attributions=`*(
  options: OSMOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `cacheSize=`*(options: OSMOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(
  options: OSMOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `crossOrigin=`*(
  options: OSMOptions, value: JsObject
) {.importjs: "#.crossOrigin = #".}

proc `referrerPolicy=`*(
  options: OSMOptions, value: cstring
) {.importjs: "#.referrerPolicy = #".}

proc `interpolate=`*(
  options: OSMOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `maxZoom=`*(options: OSMOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `reprojectionErrorThreshold=`*(
  options: OSMOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `tileLoadFunction=`*(
  options: OSMOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `transition=`*(
  options: OSMOptions, value: float
) {.importjs: "#.transition = #".}

proc `url=`*(options: OSMOptions, value: cstring) {.importjs: "#.url = #".}
proc `wrapX=`*(options: OSMOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `zDirection=`*(
  options: OSMOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: OSMOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc newOSM*(
  options: JsObject = jsUndefined
): OSM {.importjs: "(new olNs_source_OSM.default(#))".}

proc newOSM*(
  options: OSMOptions
): OSM {.importjs: "(new olNs_source_OSM.default(#))".}

proc getATTRIBUTION*(): cstring {.importjs: "(olNs_source_OSM.ATTRIBUTION)".}
