import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_Event from 'ol/render/Event.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_Event)".}

type
  OlRenderEvent* = ref object of JsRoot
proc newOlRenderEvent*(typeVal: JsObject, inversePixelTransform: JsObject = jsUndefined, frameState: JsObject = jsUndefined, context: JsObject = jsUndefined): OlRenderEvent {.importjs: "(new olNs_render_Event.default(#, #, #, #))".}
