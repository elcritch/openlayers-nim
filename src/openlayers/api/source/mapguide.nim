import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_mapguide from 'ol/source/mapguide.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_mapguide)".}

proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_mapguide.createLoader(#)".}
