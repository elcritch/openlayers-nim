import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_static from 'ol/source/static.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_static)".}

proc createLoader*(options: JsObject): JsObject {.importjs: "olNs_source_static.createLoader(#)".}
