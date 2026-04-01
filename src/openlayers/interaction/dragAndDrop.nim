import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_interaction_DragAndDrop from 'ol/interaction/DragAndDrop.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragAndDrop)".}

type
  DragAndDrop* = ref object of JsRoot
proc newDragAndDrop*(options: JsObject = jsUndefined): DragAndDrop {.importjs: "(new olNs_interaction_DragAndDrop.default(#))".}
proc handleDrop*(self: DragAndDrop, event: JsObject) {.importjs: "#.handleDrop(#)".}
proc handleStop*(self: DragAndDrop, event: JsObject) {.importjs: "#.handleStop(#)".}

type
  DragAndDropOptions* = ref object of JsRoot

proc newDragAndDropOptions*(): DragAndDropOptions {.importjs: "({})".}
proc `formatConstructors=`*(options: DragAndDropOptions, value: JsObject) {.importjs: "#.formatConstructors = #".}
proc `formatConstructors=`*(options: DragAndDropOptions, value: RootRef) {.importjs: "#.formatConstructors = #".}
proc `formatConstructors=`*[T](options: DragAndDropOptions, value: seq[T]) {.importjs: "#.formatConstructors = #".}
proc `source=`*(options: DragAndDropOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: DragAndDropOptions, value: RootRef) {.importjs: "#.source = #".}
proc `projection=`*(options: DragAndDropOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: DragAndDropOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `target=`*(options: DragAndDropOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: DragAndDropOptions, value: RootRef) {.importjs: "#.target = #".}

proc newDragAndDrop*(options: DragAndDropOptions): DragAndDrop {.importjs: "(new olNs_interaction_DragAndDrop.default(#))".}
