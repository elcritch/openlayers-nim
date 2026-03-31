import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_Composite from 'ol/renderer/Composite.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_Composite)".}

type
  OlCompositeMapRenderer* = ref object of JsRoot
proc newOlCompositeMapRenderer*(): OlCompositeMapRenderer {.importjs: "(new olNs_renderer_Composite.default())".}
proc declutter*(self: OlCompositeMapRenderer, frameState: JsObject, layerStates: JsObject) {.importjs: "#.declutter(#, #)".}
