import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragZoom from 'ol/interaction/DragZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragZoom)".}

type
  DragZoom* = ref object of JsRoot
proc newDragZoom*(options: JsObject = jsUndefined): DragZoom {.importjs: "(new olNs_interaction_DragZoom.default(#))".}
