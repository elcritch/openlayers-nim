import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_webgl_worldUtil from 'ol/renderer/webgl/worldUtil.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_webgl_worldUtil)".}

proc getWorldParameters*(frameState: JsObject, layer: JsObject): seq[float] {.importjs: "olNs_renderer_webgl_worldUtil.getWorldParameters(#, #)".}
