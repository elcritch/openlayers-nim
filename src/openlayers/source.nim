import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olSourceNamespace from 'ol/source.js';".}

proc hasSourceNamespace*(): bool {.
  importjs: "(typeof olSourceNamespace !== 'undefined')"
.}

proc getSourceNamespace*(): JsObject {.importjs: "(olSourceNamespace)".}
