import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_ImageCanvas from 'ol/ImageCanvas.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_ImageCanvas)".}

type
  OlImageCanvas* = ref object of JsRoot
proc newOlImageCanvas*(extent: JsObject, resolution: float, pixelRatio: float, canvas: JsObject, loader: JsObject = jsUndefined): OlImageCanvas {.importjs: "(new olNs_ImageCanvas.default(#, #, #, #, #))".}
proc getError*(self: OlImageCanvas): JsObject {.importjs: "#.getError()".}
