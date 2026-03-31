import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragPan from 'ol/interaction/DragPan.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragPan)".}

type DragPan* = ref object of JsRoot
proc newDragPan*(
  options: JsObject = jsUndefined
): DragPan {.importjs: "(new olNs_interaction_DragPan.default(#))".}

type DragPanOptions* = ref object of JsRoot

proc newDragPanOptions*(): DragPanOptions {.importjs: "({})".}
proc `condition=`*(
  options: DragPanOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: DragPanOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `onFocusOnly=`*(
  options: DragPanOptions, value: bool
) {.importjs: "#.onFocusOnly = #".}

proc `kinetic=`*(options: DragPanOptions, value: JsObject) {.importjs: "#.kinetic = #".}
proc `kinetic=`*(options: DragPanOptions, value: RootRef) {.importjs: "#.kinetic = #".}

proc newDragPan*(
  options: DragPanOptions
): DragPan {.importjs: "(new olNs_interaction_DragPan.default(#))".}
