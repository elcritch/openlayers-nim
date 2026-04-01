import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_geom from 'ol/geom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom)".}

proc getCircle*(): JsObject {.importjs: "(olNs_geom.Circle)".}
proc getGeometry*(): JsObject {.importjs: "(olNs_geom.Geometry)".}
proc getGeometryCollection*(): JsObject {.importjs: "(olNs_geom.GeometryCollection)".}
proc getLinearRing*(): JsObject {.importjs: "(olNs_geom.LinearRing)".}
proc getLineString*(): JsObject {.importjs: "(olNs_geom.LineString)".}
proc getMultiLineString*(): JsObject {.importjs: "(olNs_geom.MultiLineString)".}
proc getMultiPoint*(): JsObject {.importjs: "(olNs_geom.MultiPoint)".}
proc getMultiPolygon*(): JsObject {.importjs: "(olNs_geom.MultiPolygon)".}
proc getPoint*(): JsObject {.importjs: "(olNs_geom.Point)".}
proc getPolygon*(): JsObject {.importjs: "(olNs_geom.Polygon)".}
proc getSimpleGeometry*(): JsObject {.importjs: "(olNs_geom.SimpleGeometry)".}
