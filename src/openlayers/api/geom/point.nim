import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_Point from 'ol/geom/Point.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_Point)".}

type
  OlPoint* = ref object of JsRoot
proc newOlPoint*(coordinates: JsObject, layout: JsObject = jsUndefined): OlPoint {.importjs: "(new olNs_geom_Point.default(#, #))".}
