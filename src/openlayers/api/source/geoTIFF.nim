import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_GeoTIFF from 'ol/source/GeoTIFF.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_GeoTIFF)".}

type
  OlGeoTIFFSource* = ref object of JsRoot
proc newOlGeoTIFFSource*(options: JsObject): OlGeoTIFFSource {.importjs: "(new olNs_source_GeoTIFF.default(#))".}
proc getError*(self: OlGeoTIFFSource): JsObject {.importjs: "#.getError()".}
proc determineProjection*(self: OlGeoTIFFSource, sources: JsObject) {.importjs: "#.determineProjection(#)".}
proc determineTransformMatrix*(self: OlGeoTIFFSource, sources: JsObject) {.importjs: "#.determineTransformMatrix(#)".}
