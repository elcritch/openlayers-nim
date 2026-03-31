import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileDebug from 'ol/source/TileDebug.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileDebug)".}

type
  TileDebug* = ref object of JsRoot
proc newTileDebug*(options: JsObject = jsUndefined): TileDebug {.importjs: "(new olNs_source_TileDebug.default(#))".}
