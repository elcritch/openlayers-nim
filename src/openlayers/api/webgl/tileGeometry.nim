import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_TileGeometry from 'ol/webgl/TileGeometry.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_TileGeometry)".}

type
  OlTileGeometry* = ref object of JsRoot
proc newOlTileGeometry*(options: JsObject, styleRenderer: JsObject): OlTileGeometry {.importjs: "(new olNs_webgl_TileGeometry.default(#, #))".}
