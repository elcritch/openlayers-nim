import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_tileurlfunction from 'ol/tileurlfunction.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_tileurlfunction)".}

proc createFromTemplate*(templateVal: cstring, tileGrid: JsObject): JsObject {.importjs: "olNs_tileurlfunction.createFromTemplate(#, #)".}
proc createFromTemplates*(templates: seq[cstring], tileGrid: JsObject): JsObject {.importjs: "olNs_tileurlfunction.createFromTemplates(#, #)".}
proc createFromTileUrlFunctions*(tileUrlFunctions: JsObject): JsObject {.importjs: "olNs_tileurlfunction.createFromTileUrlFunctions(#)".}
proc nullTileUrlFunction*(tileCoord: JsObject, pixelRatio: float, projection: JsObject): cstring {.importjs: "olNs_tileurlfunction.nullTileUrlFunction(#, #, #)".}
