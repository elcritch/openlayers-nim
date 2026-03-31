import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olNs_interaction_KeyboardPan from 'ol/interaction/KeyboardPan.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_KeyboardPan)".}

type KeyboardPan* = ref object of JsRoot
proc newKeyboardPan*(
  options: JsObject = jsUndefined
): KeyboardPan {.importjs: "(new olNs_interaction_KeyboardPan.default(#))".}

type KeyboardPanOptions* = ref object of JsRoot

proc newKeyboardPanOptions*(): KeyboardPanOptions {.importjs: "({})".}
proc `condition=`*(
  options: KeyboardPanOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: KeyboardPanOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `duration=`*(
  options: KeyboardPanOptions, value: float
) {.importjs: "#.duration = #".}

proc `pixelDelta=`*(
  options: KeyboardPanOptions, value: float
) {.importjs: "#.pixelDelta = #".}

proc newKeyboardPan*(
  options: KeyboardPanOptions
): KeyboardPan {.importjs: "(new olNs_interaction_KeyboardPan.default(#))".}
