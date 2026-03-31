import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_reproj_DataTile from 'ol/reproj/DataTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_reproj_DataTile)".}

type
  OlReprojDataTile* = ref object of JsRoot
proc newOlReprojDataTile*(options: JsObject): OlReprojDataTile {.importjs: "(new olNs_reproj_DataTile.default(#))".}
