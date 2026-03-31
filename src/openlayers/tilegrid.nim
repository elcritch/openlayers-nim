import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olTilegridNamespace from 'ol/tilegrid.js';".}

proc hasTilegridNamespace*(): bool {.
  importjs: "(typeof olTilegridNamespace !== 'undefined')"
.}

proc getTilegridNamespace*(): JsObject {.importjs: "(olTilegridNamespace)".}
