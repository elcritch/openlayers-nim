import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragAndDrop from 'ol/interaction/DragAndDrop.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragAndDrop)".}

type
  OlDragAndDrop* = ref object of JsRoot
proc newOlDragAndDrop*(options: JsObject = jsUndefined): OlDragAndDrop {.importjs: "(new olNs_interaction_DragAndDrop.default(#))".}
proc handleDrop*(self: OlDragAndDrop, event: JsObject) {.importjs: "#.handleDrop(#)".}
proc handleStop*(self: OlDragAndDrop, event: JsObject) {.importjs: "#.handleStop(#)".}
