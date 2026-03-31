import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DblClickDragZoom from 'ol/interaction/DblClickDragZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DblClickDragZoom)".}

type
  OlDblClickDragZoom* = ref object of JsRoot
proc newOlDblClickDragZoom*(opt_options: JsObject = jsUndefined): OlDblClickDragZoom {.importjs: "(new olNs_interaction_DblClickDragZoom.default(#))".}
proc stopDown*(self: OlDblClickDragZoom, handled: bool): bool {.importjs: "#.stopDown(#)".}
proc handleDragEvent*(self: OlDblClickDragZoom, mapBrowserEvent: JsObject) {.importjs: "#.handleDragEvent(#)".}
proc handleDownEvent*(self: OlDblClickDragZoom, mapBrowserEvent: JsObject): bool {.importjs: "#.handleDownEvent(#)".}
proc handleUpEvent*(self: OlDblClickDragZoom, mapBrowserEvent: JsObject): bool {.importjs: "#.handleUpEvent(#)".}
