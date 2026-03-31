import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_LinearRing from 'ol/geom/LinearRing.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_LinearRing)".}

type
  OlLinearRing* = ref object of JsRoot
proc newOlLinearRing*(coordinates: JsObject, layout: JsObject = jsUndefined): OlLinearRing {.importjs: "(new olNs_geom_LinearRing.default(#, #))".}
proc getArea*(self: OlLinearRing): float {.importjs: "#.getArea()".}
