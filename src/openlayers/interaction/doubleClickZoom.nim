import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DoubleClickZoom from 'ol/interaction/DoubleClickZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DoubleClickZoom)".}

type
  DoubleClickZoom* = ref object of JsRoot
proc newDoubleClickZoom*(options: JsObject = jsUndefined): DoubleClickZoom {.importjs: "(new olNs_interaction_DoubleClickZoom.default(#))".}
