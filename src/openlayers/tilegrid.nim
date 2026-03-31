import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olTilegridNamespace from 'ol/tilegrid.js';".}

proc getTilegridNamespace*(): JsObject {.importjs: "(olTilegridNamespace)".}
