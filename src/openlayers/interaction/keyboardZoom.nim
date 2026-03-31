import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_KeyboardZoom from 'ol/interaction/KeyboardZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_KeyboardZoom)".}

type
  OlKeyboardZoom* = ref object of JsRoot
proc newOlKeyboardZoom*(options: JsObject = jsUndefined): OlKeyboardZoom {.importjs: "(new olNs_interaction_KeyboardZoom.default(#))".}
