import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_functions from 'ol/functions.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_functions)".}

proc TRUE*(): bool {.importjs: "olNs_functions.TRUE()".}
proc FALSE*(): bool {.importjs: "olNs_functions.FALSE()".}
proc VOID*() {.importjs: "olNs_functions.VOID()".}
proc memoizeOne*(fn: JsObject): JsObject {.importjs: "olNs_functions.memoizeOne(#)".}
proc toPromise*(getter: JsObject): JsObject {.importjs: "olNs_functions.toPromise(#)".}
