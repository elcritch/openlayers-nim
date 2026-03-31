import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olGeomNamespace from 'ol/geom.js';".}

proc hasGeomNamespace*(): bool {.importjs: "(typeof olGeomNamespace !== 'undefined')".}
proc getGeomNamespace*(): JsObject {.importjs: "(olGeomNamespace)".}
