import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olInteractionNamespace from 'ol/interaction.js';".}

proc hasInteractionNamespace*(): bool {.
  importjs: "(typeof olInteractionNamespace !== 'undefined')"
.}

proc getInteractionNamespace*(): JsObject {.importjs: "(olInteractionNamespace)".}
