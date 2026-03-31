import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Raster from 'ol/source/Raster.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Raster)".}

type
  RasterSource* = ref object of JsRoot
proc newRasterSource*(options: JsObject): RasterSource {.importjs: "(new olNs_source_Raster.default(#))".}
proc setOperation*(self: RasterSource, operation: JsObject, lib: JsObject = jsUndefined) {.importjs: "#.setOperation(#, #)".}
