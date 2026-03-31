import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_Control from 'ol/control/Control.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_Control)".}

type
  Control* = ref object of JsRoot
proc newControl*(): Control {.importjs: "(new olNs_control_Control.default())".}
