import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_WMTS from 'ol/source/WMTS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_WMTS)".}

type WMTS* = ref object of JsRoot
proc newWMTS*(options: JsObject): WMTS {.importjs: "(new olNs_source_WMTS.default(#))".}
proc getDimensions*(self: WMTS): JsObject {.importjs: "#.getDimensions()".}
proc getFormat*(self: WMTS): cstring {.importjs: "#.getFormat()".}
proc getLayer*(self: WMTS): cstring {.importjs: "#.getLayer()".}
proc getMatrixSet*(self: WMTS): cstring {.importjs: "#.getMatrixSet()".}
proc getRequestEncoding*(self: WMTS): JsObject {.importjs: "#.getRequestEncoding()".}
proc getStyle*(self: WMTS): cstring {.importjs: "#.getStyle()".}
proc getVersion*(self: WMTS): cstring {.importjs: "#.getVersion()".}
proc updateDimensions*(
  self: WMTS, dimensions: JsObject
) {.importjs: "#.updateDimensions(#)".}

proc createFromWMTSTemplate*(
  self: WMTS, templateVal: cstring
): JsObject {.importjs: "#.createFromWMTSTemplate(#)".}

proc optionsFromCapabilities*(
  wmtsCap: JsObject, config: JsObject
): JsObject {.importjs: "olNs_source_WMTS.optionsFromCapabilities(#, #)".}

type WMTSOptions* = ref object of JsRoot

proc newWMTSOptions*(): WMTSOptions {.importjs: "({})".}
proc `attributions=`*(
  options: WMTSOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: WMTSOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `attributionsCollapsible=`*(
  options: WMTSOptions, value: bool
) {.importjs: "#.attributionsCollapsible = #".}

proc `cacheSize=`*(options: WMTSOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(
  options: WMTSOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `referrerPolicy=`*(
  options: WMTSOptions, value: JsObject
) {.importjs: "#.referrerPolicy = #".}

proc `referrerPolicy=`*(
  options: WMTSOptions, value: RootRef
) {.importjs: "#.referrerPolicy = #".}

proc `interpolate=`*(
  options: WMTSOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `tileGrid=`*(options: WMTSOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: WMTSOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `projection=`*(
  options: WMTSOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: WMTSOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `reprojectionErrorThreshold=`*(
  options: WMTSOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `requestEncoding=`*(
  options: WMTSOptions, value: JsObject
) {.importjs: "#.requestEncoding = #".}

proc `requestEncoding=`*(
  options: WMTSOptions, value: RootRef
) {.importjs: "#.requestEncoding = #".}

proc `layer=`*(options: WMTSOptions, value: cstring) {.importjs: "#.layer = #".}
proc `style=`*(options: WMTSOptions, value: cstring) {.importjs: "#.style = #".}
proc `tileClass=`*(
  options: WMTSOptions, value: JsObject
) {.importjs: "#.tileClass = #".}

proc `tileClass=`*(options: WMTSOptions, value: RootRef) {.importjs: "#.tileClass = #".}
proc `tilePixelRatio=`*(
  options: WMTSOptions, value: float
) {.importjs: "#.tilePixelRatio = #".}

proc `format=`*(options: WMTSOptions, value: cstring) {.importjs: "#.format = #".}
proc `version=`*(options: WMTSOptions, value: cstring) {.importjs: "#.version = #".}
proc `matrixSet=`*(options: WMTSOptions, value: cstring) {.importjs: "#.matrixSet = #".}
proc `dimensions=`*(
  options: WMTSOptions, value: JsObject
) {.importjs: "#.dimensions = #".}

proc `dimensions=`*(
  options: WMTSOptions, value: RootRef
) {.importjs: "#.dimensions = #".}

proc `url=`*(options: WMTSOptions, value: cstring) {.importjs: "#.url = #".}
proc `tileLoadFunction=`*(
  options: WMTSOptions, value: JsObject
) {.importjs: "#.tileLoadFunction = #".}

proc `tileLoadFunction=`*(
  options: WMTSOptions, value: RootRef
) {.importjs: "#.tileLoadFunction = #".}

proc `urls=`*(options: WMTSOptions, value: seq[cstring]) {.importjs: "#.urls = #".}
proc `wrapX=`*(options: WMTSOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `transition=`*(options: WMTSOptions, value: float) {.importjs: "#.transition = #".}
proc `zDirection=`*(options: WMTSOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(
  options: WMTSOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: WMTSOptions, value: RootRef
) {.importjs: "#.zDirection = #".}

proc newWMTS*(
  options: WMTSOptions
): WMTS {.importjs: "(new olNs_source_WMTS.default(#))".}
