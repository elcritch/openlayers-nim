import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Pointer from 'ol/interaction/Pointer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Pointer)".}

type
  OlPointerInteraction* = ref object of JsRoot
proc newOlPointerInteraction*(options: JsObject = jsUndefined): OlPointerInteraction {.importjs: "(new olNs_interaction_Pointer.default(#))".}
proc handleDownEvent*(self: OlPointerInteraction, mapBrowserEvent: JsObject): bool {.importjs: "#.handleDownEvent(#)".}
proc handleDragEvent*(self: OlPointerInteraction, mapBrowserEvent: JsObject) {.importjs: "#.handleDragEvent(#)".}
proc handleMoveEvent*(self: OlPointerInteraction, mapBrowserEvent: JsObject) {.importjs: "#.handleMoveEvent(#)".}
proc handleUpEvent*(self: OlPointerInteraction, mapBrowserEvent: JsObject): bool {.importjs: "#.handleUpEvent(#)".}
proc stopDown*(self: OlPointerInteraction, handled: bool): bool {.importjs: "#.stopDown(#)".}
proc getPointerCount*(self: OlPointerInteraction): float {.importjs: "#.getPointerCount()".}

proc centroid*(pointerEvents: JsObject): JsObject {.importjs: "olNs_interaction_Pointer.centroid(#)".}
