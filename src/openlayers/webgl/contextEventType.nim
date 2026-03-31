import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_ContextEventType from 'ol/webgl/ContextEventType.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_ContextEventType)".}
