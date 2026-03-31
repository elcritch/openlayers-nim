import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragAndDrop from 'ol/interaction/DragAndDrop.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragAndDrop)".}

type
  DragAndDrop* = ref object of JsRoot
proc newDragAndDrop*(options: JsObject = jsUndefined): DragAndDrop {.importjs: "(new olNs_interaction_DragAndDrop.default(#))".}
proc handleDrop*(self: DragAndDrop, event: JsObject) {.importjs: "#.handleDrop(#)".}
proc handleStop*(self: DragAndDrop, event: JsObject) {.importjs: "#.handleStop(#)".}
