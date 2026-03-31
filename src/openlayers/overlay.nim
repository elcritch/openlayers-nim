import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olOverlayModule from 'ol/Overlay.js';".}
when defined(esmModules):
  {.emit: "import Overlay from 'ol/Overlay.js';".}

type OlOverlay* = ref object of JsRoot

proc newOlOverlay*(): OlOverlay {.importjs: "(new Overlay())".}
