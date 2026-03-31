import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olInteractionNamespace from 'ol/interaction.js';".}

proc getInteractionNamespace*(): JsObject {.importjs: "(olInteractionNamespace)".}
