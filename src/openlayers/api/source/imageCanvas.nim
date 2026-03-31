import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageCanvas from 'ol/source/ImageCanvas.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageCanvas)".}

type
  OlImageCanvasSource* = ref object of JsRoot
proc newOlImageCanvasSource*(options: JsObject = jsUndefined): OlImageCanvasSource {.importjs: "(new olNs_source_ImageCanvas.default(#))".}
