import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olNs_interaction_MouseWheelZoom from 'ol/interaction/MouseWheelZoom.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_MouseWheelZoom)".}

type MouseWheelZoom* = ref object of JsRoot
proc newMouseWheelZoom*(
  options: JsObject = jsUndefined
): MouseWheelZoom {.importjs: "(new olNs_interaction_MouseWheelZoom.default(#))".}

proc setMouseAnchor*(
  self: MouseWheelZoom, useAnchor: bool
) {.importjs: "#.setMouseAnchor(#)".}

type MouseWheelZoomOptions* = ref object of JsRoot

proc newMouseWheelZoomOptions*(): MouseWheelZoomOptions {.importjs: "({})".}
proc `condition=`*(
  options: MouseWheelZoomOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: MouseWheelZoomOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `onFocusOnly=`*(
  options: MouseWheelZoomOptions, value: bool
) {.importjs: "#.onFocusOnly = #".}

proc `maxDelta=`*(
  options: MouseWheelZoomOptions, value: float
) {.importjs: "#.maxDelta = #".}

proc `duration=`*(
  options: MouseWheelZoomOptions, value: float
) {.importjs: "#.duration = #".}

proc `timeout=`*(
  options: MouseWheelZoomOptions, value: float
) {.importjs: "#.timeout = #".}

proc `useAnchor=`*(
  options: MouseWheelZoomOptions, value: bool
) {.importjs: "#.useAnchor = #".}

proc `constrainResolution=`*(
  options: MouseWheelZoomOptions, value: bool
) {.importjs: "#.constrainResolution = #".}

proc newMouseWheelZoom*(
  options: MouseWheelZoomOptions
): MouseWheelZoom {.importjs: "(new olNs_interaction_MouseWheelZoom.default(#))".}
