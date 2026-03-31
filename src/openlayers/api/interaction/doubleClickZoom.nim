import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DoubleClickZoom from 'ol/interaction/DoubleClickZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DoubleClickZoom)".}

type
  OlDoubleClickZoom* = ref object of JsRoot
proc newOlDoubleClickZoom*(options: JsObject = jsUndefined): OlDoubleClickZoom {.importjs: "(new olNs_interaction_DoubleClickZoom.default(#))".}
