import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_GeoTIFF from 'ol/source/GeoTIFF.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_GeoTIFF)".}

type
  GeoTIFFSource* = ref object of JsRoot
proc newGeoTIFFSource*(options: JsObject): GeoTIFFSource {.importjs: "(new olNs_source_GeoTIFF.default(#))".}
proc getError*(self: GeoTIFFSource): JsObject {.importjs: "#.getError()".}
proc determineProjection*(self: GeoTIFFSource, sources: JsObject) {.importjs: "#.determineProjection(#)".}
proc determineTransformMatrix*(self: GeoTIFFSource, sources: JsObject) {.importjs: "#.determineTransformMatrix(#)".}
