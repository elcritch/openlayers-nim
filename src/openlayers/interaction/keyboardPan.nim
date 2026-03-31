import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_KeyboardPan from 'ol/interaction/KeyboardPan.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_KeyboardPan)".}

type
  KeyboardPan* = ref object of JsRoot
proc newKeyboardPan*(options: JsObject = jsUndefined): KeyboardPan {.importjs: "(new olNs_interaction_KeyboardPan.default(#))".}
