import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olRenderNamespace from 'ol/render.js';".}

proc hasRenderNamespace*(): bool {.
  importjs: "(typeof olRenderNamespace !== 'undefined')"
.}

proc getRenderNamespace*(): JsObject {.importjs: "(olRenderNamespace)".}
