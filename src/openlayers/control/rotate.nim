import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_Rotate from 'ol/control/Rotate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Rotate)".}

type
  OlRotate* = ref object of JsRoot
proc newOlRotate*(options: JsObject = jsUndefined): OlRotate {.importjs: "(new olNs_control_Rotate.default(#))".}
