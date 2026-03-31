import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_Zoom from 'ol/control/Zoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Zoom)".}

type
  OlZoom* = ref object of JsRoot
proc newOlZoom*(options: JsObject = jsUndefined): OlZoom {.importjs: "(new olNs_control_Zoom.default(#))".}
