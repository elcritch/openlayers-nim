import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_ZoomSlider from 'ol/control/ZoomSlider.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_ZoomSlider)".}

type
  ZoomSlider* = ref object of JsRoot
proc newZoomSlider*(options: JsObject = jsUndefined): ZoomSlider {.importjs: "(new olNs_control_ZoomSlider.default(#))".}
