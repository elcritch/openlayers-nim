import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_obj from 'ol/obj.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_obj)".}

proc clear*(objectVal: JsObject) {.importjs: "olNs_obj.clear(#)".}
proc isEmpty*(objectVal: JsObject): bool {.importjs: "olNs_obj.isEmpty(#)".}
