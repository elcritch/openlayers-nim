import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragZoom from 'ol/interaction/DragZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragZoom)".}

type
  OlDragZoom* = ref object of JsRoot
proc newOlDragZoom*(options: JsObject = jsUndefined): OlDragZoom {.importjs: "(new olNs_interaction_DragZoom.default(#))".}
