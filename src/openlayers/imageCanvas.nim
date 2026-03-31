import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olImageCanvasModule from 'ol/ImageCanvas.js';".}
when defined(esmModules):
  {.emit: "import ImageCanvas from 'ol/ImageCanvas.js';".}
type OlImageCanvas* = ref object of JsRoot

proc newOlImageCanvas*(
  extent: JsObject,
  resolution: float,
  pixelRatio: float,
  canvas: JsObject,
  loader: JsObject = jsUndefined,
): OlImageCanvas {.importjs: "(new ImageCanvas(#, #, #, #, #))".}
