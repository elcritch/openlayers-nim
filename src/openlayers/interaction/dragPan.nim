import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_DragPan from 'ol/interaction/DragPan.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DragPan)".}

type
  OlDragPan* = ref object of JsRoot
proc newOlDragPan*(options: JsObject = jsUndefined): OlDragPan {.importjs: "(new olNs_interaction_DragPan.default(#))".}
