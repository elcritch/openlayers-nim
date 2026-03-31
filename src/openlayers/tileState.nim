import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olTileStateModule from 'ol/TileState.js';".}
{.emit: "import tileStateDefault from 'ol/TileState.js';".}

proc hasTileStateModule*(): bool {.
  importjs: "(typeof olTileStateModule !== 'undefined')"
.}

proc hasTileStateDefaultExport*(): bool {.
  importjs: "(typeof tileStateDefault !== 'undefined')"
.}

proc getOlTileState*(): JsObject {.importjs: "(tileStateDefault)".}
