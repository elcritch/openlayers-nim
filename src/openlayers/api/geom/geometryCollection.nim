import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_GeometryCollection from 'ol/geom/GeometryCollection.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_GeometryCollection)".}

type
  OlGeometryCollection* = ref object of JsRoot
proc newOlGeometryCollection*(geometries: JsObject): OlGeometryCollection {.importjs: "(new olNs_geom_GeometryCollection.default(#))".}
proc getGeometries*(self: OlGeometryCollection): JsObject {.importjs: "#.getGeometries()".}
proc getGeometriesArray*(self: OlGeometryCollection): JsObject {.importjs: "#.getGeometriesArray()".}
proc getGeometriesArrayRecursive*(self: OlGeometryCollection): JsObject {.importjs: "#.getGeometriesArrayRecursive()".}
proc isEmpty*(self: OlGeometryCollection): bool {.importjs: "#.isEmpty()".}
proc setGeometries*(self: OlGeometryCollection, geometries: JsObject) {.importjs: "#.setGeometries(#)".}
proc setGeometriesArray*(self: OlGeometryCollection, geometries: JsObject) {.importjs: "#.setGeometriesArray(#)".}
