import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragBox from 'ol/interaction/DragBox.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragBox)".}

type
  OlDragBox* = ref object of JsRoot
proc newOlDragBox*(options: JsObject = jsUndefined): OlDragBox {.importjs: "(new olNs_interaction_DragBox.default(#))".}
proc onBoxEnd*(self: OlDragBox, event: JsObject) {.importjs: "#.onBoxEnd(#)".}
proc defaultBoxEndCondition*(self: OlDragBox, mapBrowserEvent: JsObject, startPixel: JsObject, endPixel: JsObject): bool {.importjs: "#.defaultBoxEndCondition(#, #, #)".}
proc getGeometry*(self: OlDragBox): JsObject {.importjs: "#.getGeometry()".}
