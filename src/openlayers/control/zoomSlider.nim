import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_ZoomSlider from 'ol/control/ZoomSlider.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_ZoomSlider)".}

type ZoomSlider* = ref object of JsRoot
proc newZoomSlider*(
  options: JsObject = jsUndefined
): ZoomSlider {.importjs: "(new olNs_control_ZoomSlider.default(#))".}

type ZoomSliderOptions* = ref object of JsRoot

proc newZoomSliderOptions*(): ZoomSliderOptions {.importjs: "({})".}
proc `className=`*(
  options: ZoomSliderOptions, value: cstring
) {.importjs: "#.className = #".}

proc `duration=`*(
  options: ZoomSliderOptions, value: float
) {.importjs: "#.duration = #".}

proc `render=`*(
  options: ZoomSliderOptions, value: JsObject
) {.importjs: "#.render = #".}

proc `render=`*(options: ZoomSliderOptions, value: RootRef) {.importjs: "#.render = #".}
proc `target=`*(options: ZoomSliderOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(
  options: ZoomSliderOptions, value: JsObject
) {.importjs: "#.target = #".}

proc `target=`*(options: ZoomSliderOptions, value: RootRef) {.importjs: "#.target = #".}

proc newZoomSlider*(
  options: ZoomSliderOptions
): ZoomSlider {.importjs: "(new olNs_control_ZoomSlider.default(#))".}
