import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageStatic from 'ol/source/ImageStatic.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageStatic)".}

type Static* = ref object of JsRoot
proc newStatic*(
  options: JsObject
): Static {.importjs: "(new olNs_source_ImageStatic.default(#))".}

proc getImageExtent*(self: Static): JsObject {.importjs: "#.getImageExtent()".}
proc getUrl*(self: Static): cstring {.importjs: "#.getUrl()".}

type StaticOptions* = ref object of JsRoot

proc newStaticOptions*(): StaticOptions {.importjs: "({})".}
proc `attributions=`*(
  options: StaticOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: StaticOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `crossOrigin=`*(
  options: StaticOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `referrerPolicy=`*(
  options: StaticOptions, value: JsObject
) {.importjs: "#.referrerPolicy = #".}

proc `referrerPolicy=`*(
  options: StaticOptions, value: RootRef
) {.importjs: "#.referrerPolicy = #".}

proc `imageExtent=`*(
  options: StaticOptions, value: JsObject
) {.importjs: "#.imageExtent = #".}

proc `imageExtent=`*(
  options: StaticOptions, value: RootRef
) {.importjs: "#.imageExtent = #".}

proc `imageLoadFunction=`*(
  options: StaticOptions, value: JsObject
) {.importjs: "#.imageLoadFunction = #".}

proc `imageLoadFunction=`*(
  options: StaticOptions, value: RootRef
) {.importjs: "#.imageLoadFunction = #".}

proc `interpolate=`*(
  options: StaticOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `projection=`*(
  options: StaticOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: StaticOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `url=`*(options: StaticOptions, value: cstring) {.importjs: "#.url = #".}

proc newStatic*(
  options: StaticOptions
): Static {.importjs: "(new olNs_source_ImageStatic.default(#))".}
