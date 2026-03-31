import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Object from 'ol/Object.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Object)".}

type
  OlBaseObject* = ref object of JsRoot
proc newOlBaseObject*(): OlBaseObject {.importjs: "(new olNs_Object.default())".}
