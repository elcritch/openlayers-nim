import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olNs_interaction_KeyboardZoom from 'ol/interaction/KeyboardZoom.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_KeyboardZoom)".}

type KeyboardZoom* = ref object of JsRoot
proc newKeyboardZoom*(
  options: JsObject = jsUndefined
): KeyboardZoom {.importjs: "(new olNs_interaction_KeyboardZoom.default(#))".}

type KeyboardZoomOptions* = ref object of JsRoot

proc newKeyboardZoomOptions*(): KeyboardZoomOptions {.importjs: "({})".}
proc `duration=`*(
  options: KeyboardZoomOptions, value: float
) {.importjs: "#.duration = #".}

proc `condition=`*(
  options: KeyboardZoomOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: KeyboardZoomOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `delta=`*(options: KeyboardZoomOptions, value: float) {.importjs: "#.delta = #".}

proc newKeyboardZoom*(
  options: KeyboardZoomOptions
): KeyboardZoom {.importjs: "(new olNs_interaction_KeyboardZoom.default(#))".}
