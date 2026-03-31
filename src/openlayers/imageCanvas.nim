import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olImageCanvasModule from 'ol/ImageCanvas.js';".}
{.emit: "import ImageCanvas from 'ol/ImageCanvas.js';".}

proc hasImageCanvasModule*(): bool {.
  importjs: "(typeof olImageCanvasModule !== 'undefined')"
.}

proc hasImageCanvasConstructor*(): bool {.
  importjs: "(typeof ImageCanvas === 'function')"
.}

type OlImageCanvas* = ref object of JsRoot

proc newOlImageCanvas*(
  extent: JsObject,
  resolution: float,
  pixelRatio: float,
  canvas: JsObject,
  loader: JsObject = jsUndefined,
): OlImageCanvas {.importjs: "(new ImageCanvas(#, #, #, #, #))".}
