import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olFormatNamespace from 'ol/format.js';".}

proc hasFormatNamespace*(): bool {.
  importjs: "(typeof olFormatNamespace !== 'undefined')"
.}

proc getFormatNamespace*(): JsObject {.importjs: "(olFormatNamespace)".}
