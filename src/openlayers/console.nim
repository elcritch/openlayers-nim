import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_console from 'ol/console.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_console)".}

proc setLevel*(l: JsObject) {.importjs: "olNs_console.setLevel(#)".}
proc log*(args: JsObject = jsUndefined) {.importjs: "olNs_console.log(#)".}
proc warn*(args: JsObject = jsUndefined) {.importjs: "olNs_console.warn(#)".}
proc error*(args: JsObject = jsUndefined) {.importjs: "olNs_console.error(#)".}
