import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_util from 'ol/util.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_util)".}

proc abstract*() {.importjs: "olNs_util.abstract()".}
proc getUid*(obj: JsObject): cstring {.importjs: "olNs_util.getUid(#)".}

proc getVERSION*(): cstring {.importjs: "(olNs_util.VERSION)".}
