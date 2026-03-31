import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_webgl_renderinstructions from 'ol/render/webgl/renderinstructions.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_webgl_renderinstructions)".}

proc getCustomAttributesSize*(customAttributes: JsObject): float {.importjs: "olNs_render_webgl_renderinstructions.getCustomAttributesSize(#)".}
proc generatePointRenderInstructions*(batch: JsObject, renderInstructions: JsObject, customAttributes: JsObject, transform: JsObject): JsObject {.importjs: "olNs_render_webgl_renderinstructions.generatePointRenderInstructions(#, #, #, #)".}
proc generateLineStringRenderInstructions*(batch: JsObject, renderInstructions: JsObject, customAttributes: JsObject, transform: JsObject): JsObject {.importjs: "olNs_render_webgl_renderinstructions.generateLineStringRenderInstructions(#, #, #, #)".}
proc generatePolygonRenderInstructions*(batch: JsObject, renderInstructions: JsObject, customAttributes: JsObject, transform: JsObject): JsObject {.importjs: "olNs_render_webgl_renderinstructions.generatePolygonRenderInstructions(#, #, #, #)".}
