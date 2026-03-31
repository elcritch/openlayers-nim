import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit: "import * as olNs_interaction_DragRotate from 'ol/interaction/DragRotate.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragRotate)".}

type DragRotate* = ref object of JsRoot
proc newDragRotate*(
  options: JsObject = jsUndefined
): DragRotate {.importjs: "(new olNs_interaction_DragRotate.default(#))".}

type DragRotateOptions* = ref object of JsRoot

proc newDragRotateOptions*(): DragRotateOptions {.importjs: "({})".}
proc `condition=`*(
  options: DragRotateOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: DragRotateOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `duration=`*(
  options: DragRotateOptions, value: float
) {.importjs: "#.duration = #".}

proc newDragRotate*(
  options: DragRotateOptions
): DragRotate {.importjs: "(new olNs_interaction_DragRotate.default(#))".}
