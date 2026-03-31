import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_IIIF from 'ol/source/IIIF.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_IIIF)".}

type IIIF* = ref object of JsRoot
proc newIIIF*(
  options: JsObject = jsUndefined
): IIIF {.importjs: "(new olNs_source_IIIF.default(#))".}

type IIIFOptions* = ref object of JsRoot

proc newIIIFOptions*(): IIIFOptions {.importjs: "({})".}
proc `attributions=`*(
  options: IIIFOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: IIIFOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `attributionsCollapsible=`*(
  options: IIIFOptions, value: bool
) {.importjs: "#.attributionsCollapsible = #".}

proc `cacheSize=`*(options: IIIFOptions, value: float) {.importjs: "#.cacheSize = #".}
proc `crossOrigin=`*(
  options: IIIFOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `extent=`*(options: IIIFOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: IIIFOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `format=`*(options: IIIFOptions, value: cstring) {.importjs: "#.format = #".}
proc `interpolate=`*(
  options: IIIFOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `projection=`*(
  options: IIIFOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: IIIFOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `quality=`*(options: IIIFOptions, value: cstring) {.importjs: "#.quality = #".}
proc `reprojectionErrorThreshold=`*(
  options: IIIFOptions, value: float
) {.importjs: "#.reprojectionErrorThreshold = #".}

proc `resolutions=`*(
  options: IIIFOptions, value: seq[float]
) {.importjs: "#.resolutions = #".}

proc `size=`*(options: IIIFOptions, value: JsObject) {.importjs: "#.size = #".}
proc `size=`*(options: IIIFOptions, value: RootRef) {.importjs: "#.size = #".}
proc `sizes=`*(options: IIIFOptions, value: JsObject) {.importjs: "#.sizes = #".}
proc `sizes=`*(options: IIIFOptions, value: RootRef) {.importjs: "#.sizes = #".}
proc `sizes=`*[T](options: IIIFOptions, value: seq[T]) {.importjs: "#.sizes = #".}
proc `state=`*(options: IIIFOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: IIIFOptions, value: RootRef) {.importjs: "#.state = #".}
proc `supports=`*(
  options: IIIFOptions, value: seq[cstring]
) {.importjs: "#.supports = #".}

proc `tilePixelRatio=`*(
  options: IIIFOptions, value: float
) {.importjs: "#.tilePixelRatio = #".}

proc `tileSize=`*(options: IIIFOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: IIIFOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: IIIFOptions, value: RootRef) {.importjs: "#.tileSize = #".}
proc `transition=`*(options: IIIFOptions, value: float) {.importjs: "#.transition = #".}
proc `url=`*(options: IIIFOptions, value: cstring) {.importjs: "#.url = #".}
proc `version=`*(options: IIIFOptions, value: cstring) {.importjs: "#.version = #".}
proc `zDirection=`*(options: IIIFOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(
  options: IIIFOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: IIIFOptions, value: RootRef
) {.importjs: "#.zDirection = #".}

proc newIIIF*(
  options: IIIFOptions
): IIIF {.importjs: "(new olNs_source_IIIF.default(#))".}
