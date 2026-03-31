import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragZoom from 'ol/interaction/DragZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragZoom)".}

type DragZoom* = ref object of JsRoot
proc newDragZoom*(
  options: JsObject = jsUndefined
): DragZoom {.importjs: "(new olNs_interaction_DragZoom.default(#))".}

type DragZoomOptions* = ref object of JsRoot

proc newDragZoomOptions*(): DragZoomOptions {.importjs: "({})".}
proc `className=`*(
  options: DragZoomOptions, value: cstring
) {.importjs: "#.className = #".}

proc `condition=`*(
  options: DragZoomOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: DragZoomOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `duration=`*(options: DragZoomOptions, value: float) {.importjs: "#.duration = #".}
proc `outVal=`*(options: DragZoomOptions, value: bool) {.importjs: "#.out = #".}
proc `minArea=`*(options: DragZoomOptions, value: float) {.importjs: "#.minArea = #".}

proc newDragZoom*(
  options: DragZoomOptions
): DragZoom {.importjs: "(new olNs_interaction_DragZoom.default(#))".}
