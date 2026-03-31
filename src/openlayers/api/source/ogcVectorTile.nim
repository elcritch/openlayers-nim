import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OGCVectorTile from 'ol/source/OGCVectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OGCVectorTile)".}

type
  OlOGCVectorTile* = ref object of JsRoot
proc newOlOGCVectorTile*(options: JsObject): OlOGCVectorTile {.importjs: "(new olNs_source_OGCVectorTile.default(#))".}
