import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olRenderNamespace from 'ol/render.js';".}

proc getRenderNamespace*(): JsObject {.importjs: "(olRenderNamespace)".}
