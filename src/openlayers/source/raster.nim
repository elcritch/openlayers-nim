import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Raster from 'ol/source/Raster.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Raster)".}

type RasterSource* = ref object of JsRoot
proc newRasterSource*(
  options: JsObject
): RasterSource {.importjs: "(new olNs_source_Raster.default(#))".}

proc setOperation*(
  self: RasterSource, operation: JsObject, lib: JsObject = jsUndefined
) {.importjs: "#.setOperation(#, #)".}

type RasterSourceOptions* = ref object of JsRoot

proc newRasterSourceOptions*(): RasterSourceOptions {.importjs: "({})".}
proc `sources=`*(
  options: RasterSourceOptions, value: JsObject
) {.importjs: "#.sources = #".}

proc `sources=`*(
  options: RasterSourceOptions, value: RootRef
) {.importjs: "#.sources = #".}

proc `sources=`*[T](
  options: RasterSourceOptions, value: seq[T]
) {.importjs: "#.sources = #".}

proc `operation=`*(
  options: RasterSourceOptions, value: JsObject
) {.importjs: "#.operation = #".}

proc `operation=`*(
  options: RasterSourceOptions, value: RootRef
) {.importjs: "#.operation = #".}

proc `lib=`*(options: RasterSourceOptions, value: JsObject) {.importjs: "#.lib = #".}
proc `lib=`*(options: RasterSourceOptions, value: RootRef) {.importjs: "#.lib = #".}
proc `threads=`*(
  options: RasterSourceOptions, value: float
) {.importjs: "#.threads = #".}

proc `operationType=`*(
  options: RasterSourceOptions, value: JsObject
) {.importjs: "#.operationType = #".}

proc `operationType=`*(
  options: RasterSourceOptions, value: RootRef
) {.importjs: "#.operationType = #".}

proc `resolutions=`*(
  options: RasterSourceOptions, value: seq[float]
) {.importjs: "#.resolutions = #".}

proc newRasterSource*(
  options: RasterSourceOptions
): RasterSource {.importjs: "(new olNs_source_Raster.default(#))".}

type ProcessorOptions* = ref object of JsRoot

proc newProcessorOptions*(): ProcessorOptions {.importjs: "({})".}
proc `threads=`*(options: ProcessorOptions, value: float) {.importjs: "#.threads = #".}
proc `operation=`*(
  options: ProcessorOptions, value: JsObject
) {.importjs: "#.operation = #".}

proc `operation=`*(
  options: ProcessorOptions, value: RootRef
) {.importjs: "#.operation = #".}

proc `lib=`*(options: ProcessorOptions, value: JsObject) {.importjs: "#.lib = #".}
proc `lib=`*(options: ProcessorOptions, value: RootRef) {.importjs: "#.lib = #".}
proc `queue=`*(options: ProcessorOptions, value: float) {.importjs: "#.queue = #".}
proc `imageOps=`*(options: ProcessorOptions, value: bool) {.importjs: "#.imageOps = #".}
