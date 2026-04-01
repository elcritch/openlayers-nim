import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_interaction_DragRotateAndZoom from 'ol/interaction/DragRotateAndZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragRotateAndZoom)".}

type
  DragRotateAndZoom* = ref object of JsRoot
proc newDragRotateAndZoom*(options: JsObject = jsUndefined): DragRotateAndZoom {.importjs: "(new olNs_interaction_DragRotateAndZoom.default(#))".}

type
  DragRotateAndZoomOptions* = ref object of JsRoot

proc newDragRotateAndZoomOptions*(): DragRotateAndZoomOptions {.importjs: "({})".}
proc `condition=`*(options: DragRotateAndZoomOptions, value: JsObject) {.importjs: "#.condition = #".}
proc `condition=`*(options: DragRotateAndZoomOptions, value: RootRef) {.importjs: "#.condition = #".}
proc `duration=`*(options: DragRotateAndZoomOptions, value: float) {.importjs: "#.duration = #".}

proc newDragRotateAndZoom*(options: DragRotateAndZoomOptions): DragRotateAndZoom {.importjs: "(new olNs_interaction_DragRotateAndZoom.default(#))".}
