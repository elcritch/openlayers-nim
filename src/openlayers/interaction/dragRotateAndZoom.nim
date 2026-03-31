import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragRotateAndZoom from 'ol/interaction/DragRotateAndZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragRotateAndZoom)".}

type
  DragRotateAndZoom* = ref object of JsRoot
proc newDragRotateAndZoom*(options: JsObject = jsUndefined): DragRotateAndZoom {.importjs: "(new olNs_interaction_DragRotateAndZoom.default(#))".}
