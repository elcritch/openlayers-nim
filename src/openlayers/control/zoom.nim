import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_Zoom from 'ol/control/Zoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Zoom)".}

type
  Zoom* = ref object of JsRoot
proc newZoom*(options: JsObject = jsUndefined): Zoom {.importjs: "(new olNs_control_Zoom.default(#))".}
