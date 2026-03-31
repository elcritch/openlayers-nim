import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olSourceNamespace from 'ol/source.js';".}

proc getSourceNamespace*(): JsObject {.importjs: "(olSourceNamespace)".}
