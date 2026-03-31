import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragRotate from 'ol/interaction/DragRotate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragRotate)".}

type
  DragRotate* = ref object of JsRoot
proc newDragRotate*(options: JsObject = jsUndefined): DragRotate {.importjs: "(new olNs_interaction_DragRotate.default(#))".}
