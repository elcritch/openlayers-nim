import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragRotateAndZoom from 'ol/interaction/DragRotateAndZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragRotateAndZoom)".}

type
  OlDragRotateAndZoom* = ref object of JsRoot
proc newOlDragRotateAndZoom*(options: JsObject = jsUndefined): OlDragRotateAndZoom {.importjs: "(new olNs_interaction_DragRotateAndZoom.default(#))".}
