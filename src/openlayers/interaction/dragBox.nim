import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragBox from 'ol/interaction/DragBox.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragBox)".}

type DragBox* = ref object of JsRoot
proc newDragBox*(
  options: JsObject = jsUndefined
): DragBox {.importjs: "(new olNs_interaction_DragBox.default(#))".}

proc onBoxEnd*(self: DragBox, event: JsObject) {.importjs: "#.onBoxEnd(#)".}
proc defaultBoxEndCondition*(
  self: DragBox, mapBrowserEvent: JsObject, startPixel: JsObject, endPixel: JsObject
): bool {.importjs: "#.defaultBoxEndCondition(#, #, #)".}

proc getGeometry*(self: DragBox): JsObject {.importjs: "#.getGeometry()".}

type DragBoxOptions* = ref object of JsRoot

proc newDragBoxOptions*(): DragBoxOptions {.importjs: "({})".}
proc `className=`*(
  options: DragBoxOptions, value: cstring
) {.importjs: "#.className = #".}

proc `condition=`*(
  options: DragBoxOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: DragBoxOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `minArea=`*(options: DragBoxOptions, value: float) {.importjs: "#.minArea = #".}
proc `boxEndCondition=`*(
  options: DragBoxOptions, value: JsObject
) {.importjs: "#.boxEndCondition = #".}

proc `boxEndCondition=`*(
  options: DragBoxOptions, value: RootRef
) {.importjs: "#.boxEndCondition = #".}

proc `onBoxEnd=`*(
  options: DragBoxOptions, value: JsObject
) {.importjs: "#.onBoxEnd = #".}

proc `onBoxEnd=`*(
  options: DragBoxOptions, value: RootRef
) {.importjs: "#.onBoxEnd = #".}

proc newDragBox*(
  options: DragBoxOptions
): DragBox {.importjs: "(new olNs_interaction_DragBox.default(#))".}
