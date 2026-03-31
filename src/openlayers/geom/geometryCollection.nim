import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olNs_geom_GeometryCollection from 'ol/geom/GeometryCollection.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_GeometryCollection)".}

type GeometryCollection* = ref object of JsRoot
proc newGeometryCollection*(
  geometries: JsObject
): GeometryCollection {.importjs: "(new olNs_geom_GeometryCollection.default(#))".}

proc getGeometries*(
  self: GeometryCollection
): JsObject {.importjs: "#.getGeometries()".}

proc getGeometriesArray*(
  self: GeometryCollection
): JsObject {.importjs: "#.getGeometriesArray()".}

proc getGeometriesArrayRecursive*(
  self: GeometryCollection
): JsObject {.importjs: "#.getGeometriesArrayRecursive()".}

proc isEmpty*(self: GeometryCollection): bool {.importjs: "#.isEmpty()".}
proc setGeometries*(
  self: GeometryCollection, geometries: JsObject
) {.importjs: "#.setGeometries(#)".}

proc setGeometriesArray*(
  self: GeometryCollection, geometries: JsObject
) {.importjs: "#.setGeometriesArray(#)".}
