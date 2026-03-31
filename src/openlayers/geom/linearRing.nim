import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_LinearRing from 'ol/geom/LinearRing.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_LinearRing)".}

type
  LinearRing* = ref object of JsRoot
proc newLinearRing*(coordinates: JsObject, layout: JsObject = jsUndefined): LinearRing {.importjs: "(new olNs_geom_LinearRing.default(#, #))".}
proc getArea*(self: LinearRing): float {.importjs: "#.getArea()".}
