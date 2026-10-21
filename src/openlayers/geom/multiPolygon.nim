import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(openlayers.globalBundle):
  {.
    emit: "var olNs_geom_MultiPolygon = {default: globalThis.ol?.geom?.MultiPolygon};"
  .}
elif not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_geom_MultiPolygon from 'ol/geom/MultiPolygon.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_MultiPolygon)".}

type MultiPolygon* = ref object of JsRoot
proc newMultiPolygon*(
  coordinates: JsObject, layout: JsObject = jsUndefined, endss: JsObject = jsUndefined
): MultiPolygon {.importjs: "(new olNs_geom_MultiPolygon.default(#, #, #))".}

proc appendPolygon*(
  self: MultiPolygon, polygon: JsObject
) {.importjs: "#.appendPolygon(#)".}

proc getArea*(self: MultiPolygon): float {.importjs: "#.getArea()".}
proc getEndss*(self: MultiPolygon): JsObject {.importjs: "#.getEndss()".}
proc getFlatInteriorPoints*(
  self: MultiPolygon
): seq[float] {.importjs: "#.getFlatInteriorPoints()".}

proc getInteriorPoints*(
  self: MultiPolygon
): JsObject {.importjs: "#.getInteriorPoints()".}

proc getOrientedFlatCoordinates*(
  self: MultiPolygon
): seq[float] {.importjs: "#.getOrientedFlatCoordinates()".}

proc getPolygon*(
  self: MultiPolygon, index: float
): JsObject {.importjs: "#.getPolygon(#)".}

proc getPolygons*(self: MultiPolygon): JsObject {.importjs: "#.getPolygons()".}

type PolygonCoordinates* = seq[seq[seq[seq[float]]]]

proc newMultiPolygon*(
  coordinates: PolygonCoordinates
): MultiPolygon {.importjs: "new olNs_geom_MultiPolygon.default(#)".}

proc getCoordinates*(
  self: MultiPolygon, rightHanded: bool
): PolygonCoordinates {.importjs: "#.getCoordinates(#)".}
