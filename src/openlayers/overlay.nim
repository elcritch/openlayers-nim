import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olOverlayModule from 'ol/Overlay.js';".}
{.emit: "import Overlay from 'ol/Overlay.js';".}

proc hasOverlayModule*(): bool {.importjs: "(typeof olOverlayModule !== 'undefined')".}
proc hasOverlayConstructor*(): bool {.importjs: "(typeof Overlay === 'function')".}

type OlOverlay* = ref object of JsRoot

proc newOlOverlay*(): OlOverlay {.importjs: "(new Overlay())".}
