import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_geom_SimpleGeometry from 'ol/geom/SimpleGeometry.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_SimpleGeometry)".}

type
  SimpleGeometry* = ref object of JsRoot
proc newSimpleGeometry*(): SimpleGeometry {.importjs: "(new olNs_geom_SimpleGeometry.default())".}
proc getCoordinates*(self: SimpleGeometry): JsObject {.importjs: "#.getCoordinates()".}
proc getFirstCoordinate*(self: SimpleGeometry): JsObject {.importjs: "#.getFirstCoordinate()".}
proc getFlatCoordinates*(self: SimpleGeometry): seq[float] {.importjs: "#.getFlatCoordinates()".}
proc getLastCoordinate*(self: SimpleGeometry): JsObject {.importjs: "#.getLastCoordinate()".}
proc getLayout*(self: SimpleGeometry): JsObject {.importjs: "#.getLayout()".}
proc getSimplifiedGeometryInternal*(self: SimpleGeometry, squaredTolerance: float): JsObject {.importjs: "#.getSimplifiedGeometryInternal(#)".}
proc getStride*(self: SimpleGeometry): float {.importjs: "#.getStride()".}
proc setFlatCoordinates*(self: SimpleGeometry, layout: JsObject, flatCoordinates: seq[float]) {.importjs: "#.setFlatCoordinates(#, #)".}
proc setCoordinates*(self: SimpleGeometry, coordinates: JsObject, layout: JsObject = jsUndefined) {.importjs: "#.setCoordinates(#, #)".}
proc setLayout*(self: SimpleGeometry, layout: JsObject, coordinates: JsObject, nesting: float) {.importjs: "#.setLayout(#, #, #)".}

proc getLayoutForStride*(stride: float): JsObject {.importjs: "olNs_geom_SimpleGeometry.getLayoutForStride(#)".}
proc getStrideForLayout*(layout: JsObject): float {.importjs: "olNs_geom_SimpleGeometry.getStrideForLayout(#)".}
proc transformGeom2D*(simpleGeometry: JsObject, transform: JsObject, dest: JsObject = jsUndefined): seq[float] {.importjs: "olNs_geom_SimpleGeometry.transformGeom2D(#, #, #)".}
