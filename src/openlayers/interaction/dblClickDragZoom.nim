import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DblClickDragZoom from 'ol/interaction/DblClickDragZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DblClickDragZoom)".}

type
  DblClickDragZoom* = ref object of JsRoot
proc newDblClickDragZoom*(opt_options: JsObject = jsUndefined): DblClickDragZoom {.importjs: "(new olNs_interaction_DblClickDragZoom.default(#))".}
proc stopDown*(self: DblClickDragZoom, handled: bool): bool {.importjs: "#.stopDown(#)".}
proc handleDragEvent*(self: DblClickDragZoom, mapBrowserEvent: JsObject) {.importjs: "#.handleDragEvent(#)".}
proc handleDownEvent*(self: DblClickDragZoom, mapBrowserEvent: JsObject): bool {.importjs: "#.handleDownEvent(#)".}
proc handleUpEvent*(self: DblClickDragZoom, mapBrowserEvent: JsObject): bool {.importjs: "#.handleUpEvent(#)".}
