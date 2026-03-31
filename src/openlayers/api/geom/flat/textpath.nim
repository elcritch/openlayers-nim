import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_textpath from 'ol/geom/flat/textpath.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_textpath)".}

proc drawTextOnPath*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, text: cstring, startM: float, maxAngle: float, scale: float, measureAndCacheTextWidth: JsObject, font: cstring, cache: JsObject, rotation: float, keepUpright: JsObject = jsUndefined): JsObject {.importjs: "olNs_geom_flat_textpath.drawTextOnPath(#, #, #, #, #, #, #, #, #, #, #, #, #)".}
