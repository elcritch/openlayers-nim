import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_defaults from 'ol/control/defaults.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_defaults)".}

type OlControlDefaultsOptions* = ref object of JsRoot

proc newOlControlDefaultsOptions*(): OlControlDefaultsOptions {.importjs: "({})".}
proc `attribution=`*(
  options: OlControlDefaultsOptions, value: bool
) {.importjs: "#.attribution = #".}

proc `attributionOptions=`*(
  options: OlControlDefaultsOptions, value: JsObject
) {.importjs: "#.attributionOptions = #".}

proc `attributionOptions=`*(
  options: OlControlDefaultsOptions, value: RootRef
) {.importjs: "#.attributionOptions = #".}

proc `rotate=`*(
  options: OlControlDefaultsOptions, value: bool
) {.importjs: "#.rotate = #".}

proc `rotateOptions=`*(
  options: OlControlDefaultsOptions, value: JsObject
) {.importjs: "#.rotateOptions = #".}

proc `zoom=`*(options: OlControlDefaultsOptions, value: bool) {.importjs: "#.zoom = #".}
proc `zoomOptions=`*(
  options: OlControlDefaultsOptions, value: JsObject
) {.importjs: "#.zoomOptions = #".}

proc defaults*(
  options: JsObject = jsUndefined
): JsObject {.importjs: "olNs_control_defaults.defaults(#)".}

proc defaults*(
  options: OlControlDefaultsOptions
): JsObject {.importjs: "olNs_control_defaults.defaults(#)".}
