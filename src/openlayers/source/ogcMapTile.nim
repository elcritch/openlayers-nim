import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OGCMapTile from 'ol/source/OGCMapTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OGCMapTile)".}

type
  OGCMapTile* = ref object of JsRoot
proc newOGCMapTile*(options: JsObject): OGCMapTile {.importjs: "(new olNs_source_OGCMapTile.default(#))".}
