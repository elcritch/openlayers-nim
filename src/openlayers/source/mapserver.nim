import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_mapserver from 'ol/source/mapserver.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_mapserver)".}

proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_mapserver.createLoader(#)".}
