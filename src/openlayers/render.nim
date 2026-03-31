import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render from 'ol/render.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render)".}

proc toContext*(context: JsObject, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_render.toContext(#, #)".}
proc getVectorContext*(event: JsObject): JsObject {.importjs: "olNs_render.getVectorContext(#)".}
proc getRenderPixel*(event: JsObject, pixel: JsObject): JsObject {.importjs: "olNs_render.getRenderPixel(#, #)".}
