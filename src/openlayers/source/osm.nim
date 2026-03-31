import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OSM from 'ol/source/OSM.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OSM)".}

type
  OlOSM* = ref object of JsRoot
proc newOlOSM*(options: JsObject = jsUndefined): OlOSM {.importjs: "(new olNs_source_OSM.default(#))".}

proc getATTRIBUTION*(): cstring {.importjs: "(olNs_source_OSM.ATTRIBUTION)".}
