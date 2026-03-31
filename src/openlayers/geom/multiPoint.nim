import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_MultiPoint from 'ol/geom/MultiPoint.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_MultiPoint)".}

type MultiPoint* = ref object of JsRoot
proc newMultiPoint*(
  coordinates: JsObject, layout: JsObject = jsUndefined
): MultiPoint {.importjs: "(new olNs_geom_MultiPoint.default(#, #))".}

proc appendPoint*(self: MultiPoint, point: JsObject) {.importjs: "#.appendPoint(#)".}
proc getPoint*(self: MultiPoint, index: float): JsObject {.importjs: "#.getPoint(#)".}
proc getPoints*(self: MultiPoint): JsObject {.importjs: "#.getPoints()".}
