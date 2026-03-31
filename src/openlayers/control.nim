import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olControlNamespace from 'ol/control.js';".}

proc getControlNamespace*(): JsObject {.importjs: "(olControlNamespace)".}
