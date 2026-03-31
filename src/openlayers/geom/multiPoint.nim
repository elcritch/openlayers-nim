import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_MultiPoint from 'ol/geom/MultiPoint.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_MultiPoint)".}

type
  OlMultiPoint* = ref object of JsRoot
proc newOlMultiPoint*(coordinates: JsObject, layout: JsObject = jsUndefined): OlMultiPoint {.importjs: "(new olNs_geom_MultiPoint.default(#, #))".}
proc appendPoint*(self: OlMultiPoint, point: JsObject) {.importjs: "#.appendPoint(#)".}
proc getPoint*(self: OlMultiPoint, index: float): JsObject {.importjs: "#.getPoint(#)".}
proc getPoints*(self: OlMultiPoint): JsObject {.importjs: "#.getPoints()".}
