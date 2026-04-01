import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_interaction_DoubleClickZoom from 'ol/interaction/DoubleClickZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_DoubleClickZoom)".}

type
  DoubleClickZoom* = ref object of JsRoot
proc newDoubleClickZoom*(options: JsObject = jsUndefined): DoubleClickZoom {.importjs: "(new olNs_interaction_DoubleClickZoom.default(#))".}

type
  DoubleClickZoomOptions* = ref object of JsRoot

proc newDoubleClickZoomOptions*(): DoubleClickZoomOptions {.importjs: "({})".}
proc `duration=`*(options: DoubleClickZoomOptions, value: float) {.importjs: "#.duration = #".}
proc `delta=`*(options: DoubleClickZoomOptions, value: float) {.importjs: "#.delta = #".}

proc newDoubleClickZoom*(options: DoubleClickZoomOptions): DoubleClickZoom {.importjs: "(new olNs_interaction_DoubleClickZoom.default(#))".}
