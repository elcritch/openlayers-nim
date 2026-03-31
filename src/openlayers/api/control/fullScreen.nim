import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_FullScreen from 'ol/control/FullScreen.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_FullScreen)".}

type
  OlFullScreen* = ref object of JsRoot
proc newOlFullScreen*(options: JsObject = jsUndefined): OlFullScreen {.importjs: "(new olNs_control_FullScreen.default(#))".}
