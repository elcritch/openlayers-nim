import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_SimpleGeometry from 'ol/geom/SimpleGeometry.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_SimpleGeometry)".}

type
  OlSimpleGeometry* = ref object of JsRoot
proc newOlSimpleGeometry*(): OlSimpleGeometry {.importjs: "(new olNs_geom_SimpleGeometry.default())".}
proc getCoordinates*(self: OlSimpleGeometry): JsObject {.importjs: "#.getCoordinates()".}
proc getFirstCoordinate*(self: OlSimpleGeometry): JsObject {.importjs: "#.getFirstCoordinate()".}
proc getFlatCoordinates*(self: OlSimpleGeometry): seq[float] {.importjs: "#.getFlatCoordinates()".}
proc getLastCoordinate*(self: OlSimpleGeometry): JsObject {.importjs: "#.getLastCoordinate()".}
proc getLayout*(self: OlSimpleGeometry): JsObject {.importjs: "#.getLayout()".}
proc getSimplifiedGeometryInternal*(self: OlSimpleGeometry, squaredTolerance: float): JsObject {.importjs: "#.getSimplifiedGeometryInternal(#)".}
proc getStride*(self: OlSimpleGeometry): float {.importjs: "#.getStride()".}
proc setFlatCoordinates*(self: OlSimpleGeometry, layout: JsObject, flatCoordinates: seq[float]) {.importjs: "#.setFlatCoordinates(#, #)".}
proc setCoordinates*(self: OlSimpleGeometry, coordinates: JsObject, layout: JsObject = jsUndefined) {.importjs: "#.setCoordinates(#, #)".}
proc setLayout*(self: OlSimpleGeometry, layout: JsObject, coordinates: JsObject, nesting: float) {.importjs: "#.setLayout(#, #, #)".}

proc getLayoutForStride*(stride: float): JsObject {.importjs: "olNs_geom_SimpleGeometry.getLayoutForStride(#)".}
proc getStrideForLayout*(layout: JsObject): float {.importjs: "olNs_geom_SimpleGeometry.getStrideForLayout(#)".}
proc transformGeom2D*(simpleGeometry: JsObject, transform: JsObject, dest: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_SimpleGeometry.transformGeom2D(#, #, #)".}
