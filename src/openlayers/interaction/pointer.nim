import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Pointer from 'ol/interaction/Pointer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Pointer)".}

type
  PointerInteraction* = ref object of JsRoot
proc newPointerInteraction*(options: JsObject = jsUndefined): PointerInteraction {.importjs: "(new olNs_interaction_Pointer.default(#))".}
proc handleDownEvent*(self: PointerInteraction, mapBrowserEvent: JsObject): bool {.importjs: "#.handleDownEvent(#)".}
proc handleDragEvent*(self: PointerInteraction, mapBrowserEvent: JsObject) {.importjs: "#.handleDragEvent(#)".}
proc handleMoveEvent*(self: PointerInteraction, mapBrowserEvent: JsObject) {.importjs: "#.handleMoveEvent(#)".}
proc handleUpEvent*(self: PointerInteraction, mapBrowserEvent: JsObject): bool {.importjs: "#.handleUpEvent(#)".}
proc stopDown*(self: PointerInteraction, handled: bool): bool {.importjs: "#.stopDown(#)".}
proc getPointerCount*(self: PointerInteraction): float {.importjs: "#.getPointerCount()".}

proc centroid*(pointerEvents: JsObject): JsObject {.importjs: "olNs_interaction_Pointer.centroid(#)".}
