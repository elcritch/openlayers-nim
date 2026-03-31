import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageCanvas from 'ol/source/ImageCanvas.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageCanvas)".}

type
  ImageCanvasSource* = ref object of JsRoot
proc newImageCanvasSource*(options: JsObject = jsUndefined): ImageCanvasSource {.importjs: "(new olNs_source_ImageCanvas.default(#))".}
