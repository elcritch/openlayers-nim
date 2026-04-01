import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GeoJSON from 'ol/format/GeoJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GeoJSON)".}

type GeoJSON* = ref object of JsRoot
proc newGeoJSON*(): GeoJSON {.importjs: "(new olNs_format_GeoJSON.default())".}
proc readFeatures*(
  self: GeoJSON, source: JsObject, options: JsObject = jsUndefined
): seq[JsObject] {.importjs: "#.readFeatures(#, #)".}

proc readFeatures*(
  self: GeoJSON, source: RootRef, options: JsObject = jsUndefined
): seq[JsObject] {.importjs: "#.readFeatures(#, #)".}

proc readFeatures*(
  self: GeoJSON, source: cstring, options: JsObject = jsUndefined
): seq[JsObject] {.importjs: "#.readFeatures(#, #)".}

type GeoJSONOptions* = ref object of JsRoot

proc newGeoJSONOptions*(): GeoJSONOptions {.importjs: "({})".}
proc `dataProjection=`*(
  options: GeoJSONOptions, value: JsObject
) {.importjs: "#.dataProjection = #".}

proc `dataProjection=`*(
  options: GeoJSONOptions, value: RootRef
) {.importjs: "#.dataProjection = #".}

proc `featureProjection=`*(
  options: GeoJSONOptions, value: JsObject
) {.importjs: "#.featureProjection = #".}

proc `featureProjection=`*(
  options: GeoJSONOptions, value: RootRef
) {.importjs: "#.featureProjection = #".}

proc `geometryName=`*(
  options: GeoJSONOptions, value: cstring
) {.importjs: "#.geometryName = #".}

proc `extractGeometryName=`*(
  options: GeoJSONOptions, value: bool
) {.importjs: "#.extractGeometryName = #".}

proc `featureClass=`*(
  options: GeoJSONOptions, value: JsObject
) {.importjs: "#.featureClass = #".}

proc `featureClass=`*(
  options: GeoJSONOptions, value: RootRef
) {.importjs: "#.featureClass = #".}

proc newGeoJSON*(
  options: GeoJSONOptions
): GeoJSON {.importjs: "(new olNs_format_GeoJSON.default(#))".}
