import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit: "import * as olNs_interaction_PinchZoom from 'ol/interaction/PinchZoom.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_PinchZoom)".}

type PinchZoom* = ref object of JsRoot
proc newPinchZoom*(
  options: JsObject = jsUndefined
): PinchZoom {.importjs: "(new olNs_interaction_PinchZoom.default(#))".}

type PinchZoomOptions* = ref object of JsRoot

proc newPinchZoomOptions*(): PinchZoomOptions {.importjs: "({})".}
proc `duration=`*(
  options: PinchZoomOptions, value: float
) {.importjs: "#.duration = #".}

proc newPinchZoom*(
  options: PinchZoomOptions
): PinchZoom {.importjs: "(new olNs_interaction_PinchZoom.default(#))".}
