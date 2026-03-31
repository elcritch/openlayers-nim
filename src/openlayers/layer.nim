import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olLayerNamespace from 'ol/layer.js';".}

proc hasLayerNamespace*(): bool {.
  importjs: "(typeof olLayerNamespace !== 'undefined')"
.}

proc getLayerNamespace*(): JsObject {.importjs: "(olLayerNamespace)".}
