import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OGCVectorTile from 'ol/source/OGCVectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OGCVectorTile)".}

type
  OGCVectorTile* = ref object of JsRoot
proc newOGCVectorTile*(options: JsObject): OGCVectorTile {.importjs: "(new olNs_source_OGCVectorTile.default(#))".}
