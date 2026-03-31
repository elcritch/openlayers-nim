import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_PinchZoom from 'ol/interaction/PinchZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_PinchZoom)".}

type
  OlPinchZoom* = ref object of JsRoot
proc newOlPinchZoom*(options: JsObject = jsUndefined): OlPinchZoom {.importjs: "(new olNs_interaction_PinchZoom.default(#))".}
