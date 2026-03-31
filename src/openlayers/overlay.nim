import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Overlay from 'ol/Overlay.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Overlay)".}

type
  OlOverlay* = ref object of JsRoot
proc newOlOverlay*(): OlOverlay {.importjs: "(new olNs_Overlay.default())".}
