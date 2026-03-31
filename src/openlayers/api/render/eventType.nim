import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_EventType from 'ol/render/EventType.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_EventType)".}
