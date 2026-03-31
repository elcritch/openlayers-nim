import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_PinchRotate from 'ol/interaction/PinchRotate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_PinchRotate)".}

type
  PinchRotate* = ref object of JsRoot
proc newPinchRotate*(options: JsObject = jsUndefined): PinchRotate {.importjs: "(new olNs_interaction_PinchRotate.default(#))".}

type
  PinchRotateOptions* = ref object of JsRoot

proc newPinchRotateOptions*(): PinchRotateOptions {.importjs: "({})".}
proc `duration=`*(options: PinchRotateOptions, value: float) {.importjs: "#.duration = #".}
proc `threshold=`*(options: PinchRotateOptions, value: float) {.importjs: "#.threshold = #".}

proc newPinchRotate*(options: PinchRotateOptions): PinchRotate {.importjs: "(new olNs_interaction_PinchRotate.default(#))".}
