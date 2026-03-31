import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_StadiaMaps from 'ol/source/StadiaMaps.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_StadiaMaps)".}

type StadiaMaps* = ref object of JsRoot
proc newStadiaMaps*(
  options: JsObject
): StadiaMaps {.importjs: "(new olNs_source_StadiaMaps.default(#))".}

type StadiaMapsOptions* = ref object of JsRoot

proc newStadiaMapsOptions*(): StadiaMapsOptions {.importjs: "({})".}
proc `cacheSize=`*(
  options: StadiaMapsOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `interpolate=`*(
  options: StadiaMapsOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `layer=`*(options: StadiaMapsOptions, value: cstring) {.importjs: "#.layer = #".}
proc `minZoom=`*(options: StadiaMapsOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: StadiaMapsOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `reprojectionErrorThreshold=`*(
  options: StadiaMapsOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `tileLoadFunction=`*(
  options: StadiaMapsOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `tileLoadFunction=`*(
  options: StadiaMapsOptions, value: RootRef
) {.importjs: "#.tileLoadFunction = #".}

proc `transition=`*(
  options: StadiaMapsOptions, value: float
) {.importjs: "#.transition = #".}

proc `url=`*(options: StadiaMapsOptions, value: cstring) {.importjs: "#.url = #".}
proc `wrapX=`*(options: StadiaMapsOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `zDirection=`*(
  options: StadiaMapsOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: StadiaMapsOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: StadiaMapsOptions, value: RootRef
) {.importjs: "#.zDirection = #".}

proc `apiKey=`*(options: StadiaMapsOptions, value: cstring) {.importjs: "#.apiKey = #".}
proc `retina=`*(options: StadiaMapsOptions, value: bool) {.importjs: "#.retina = #".}

proc newStadiaMaps*(
  options: StadiaMapsOptions
): StadiaMaps {.importjs: "(new olNs_source_StadiaMaps.default(#))".}
