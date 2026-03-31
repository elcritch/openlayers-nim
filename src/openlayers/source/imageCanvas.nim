import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageCanvas from 'ol/source/ImageCanvas.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageCanvas)".}

type ImageCanvasSource* = ref object of JsRoot
proc newImageCanvasSource*(
  options: JsObject = jsUndefined
): ImageCanvasSource {.importjs: "(new olNs_source_ImageCanvas.default(#))".}

type ImageCanvasSourceOptions* = ref object of JsRoot

proc newImageCanvasSourceOptions*(): ImageCanvasSourceOptions {.importjs: "({})".}
proc `attributions=`*(
  options: ImageCanvasSourceOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: ImageCanvasSourceOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `canvasFunction=`*(
  options: ImageCanvasSourceOptions, value: JsObject
) {.importjs: "#.canvasFunction = #".}

proc `canvasFunction=`*(
  options: ImageCanvasSourceOptions, value: RootRef
) {.importjs: "#.canvasFunction = #".}

proc `interpolate=`*(
  options: ImageCanvasSourceOptions, value: bool
) {.importjs: "#.interpolate = #".}

proc `projection=`*(
  options: ImageCanvasSourceOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: ImageCanvasSourceOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `ratio=`*(
  options: ImageCanvasSourceOptions, value: float
) {.importjs: "#.ratio = #".}

proc `resolutions=`*(
  options: ImageCanvasSourceOptions, value: seq[float]
) {.importjs: "#.resolutions = #".}

proc `state=`*(
  options: ImageCanvasSourceOptions, value: JsObject
) {.importjs: "#.state = #".}

proc `state=`*(
  options: ImageCanvasSourceOptions, value: RootRef
) {.importjs: "#.state = #".}

proc newImageCanvasSource*(
  options: ImageCanvasSourceOptions
): ImageCanvasSource {.importjs: "(new olNs_source_ImageCanvas.default(#))".}
