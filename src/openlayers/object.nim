import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_Object from 'ol/Object.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Object)".}

type
  BaseObject* = ref object of JsRoot
proc newBaseObject*(): BaseObject {.importjs: "(new olNs_Object.default())".}
