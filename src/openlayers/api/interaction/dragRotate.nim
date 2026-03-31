import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragRotate from 'ol/interaction/DragRotate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragRotate)".}

type
  OlDragRotate* = ref object of JsRoot
proc newOlDragRotate*(options: JsObject = jsUndefined): OlDragRotate {.importjs: "(new olNs_interaction_DragRotate.default(#))".}
