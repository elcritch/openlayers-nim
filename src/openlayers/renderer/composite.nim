import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_renderer_Composite from 'ol/renderer/Composite.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_Composite)".}

type
  CompositeMapRenderer* = ref object of JsRoot
proc newCompositeMapRenderer*(): CompositeMapRenderer {.importjs: "(new olNs_renderer_Composite.default())".}
proc declutter*(self: CompositeMapRenderer, frameState: JsObject, layerStates: JsObject) {.importjs: "#.declutter(#, #)".}
