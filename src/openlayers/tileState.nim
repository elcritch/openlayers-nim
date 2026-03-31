import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olTileStateModule from 'ol/TileState.js';".}
when defined(esmModules):
  {.emit: "import tileStateDefault from 'ol/TileState.js';".}
proc getOlTileState*(): JsObject {.importjs: "(tileStateDefault)".}
