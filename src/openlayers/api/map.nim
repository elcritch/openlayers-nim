import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Map from 'ol/Map.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Map)".}

type
  OlMap* = ref object of JsRoot
proc newOlMap*(): OlMap {.importjs: "(new olNs_Map.default())".}
