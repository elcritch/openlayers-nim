import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Vector from 'ol/layer/Vector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Vector)".}

type
  OlVectorLayerOptions* = ref object of JsRoot
  OlVectorLayer* = ref object of JsRoot

proc newOlVectorLayerOptions*(): OlVectorLayerOptions {.importjs: "({})".}
proc `className=`*(
  options: OlVectorLayerOptions, value: cstring
) {.importjs: "#.className = #".}

proc `opacity=`*(
  options: OlVectorLayerOptions, value: float
) {.importjs: "#.opacity = #".}

proc `visible=`*(
  options: OlVectorLayerOptions, value: bool
) {.importjs: "#.visible = #".}

proc `extent=`*(
  options: OlVectorLayerOptions, value: JsObject
) {.importjs: "#.extent = #".}

proc `zIndex=`*(
  options: OlVectorLayerOptions, value: float
) {.importjs: "#.zIndex = #".}

proc `minResolution=`*(
  options: OlVectorLayerOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxResolution=`*(
  options: OlVectorLayerOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `minZoom=`*(
  options: OlVectorLayerOptions, value: float
) {.importjs: "#.minZoom = #".}

proc `maxZoom=`*(
  options: OlVectorLayerOptions, value: float
) {.importjs: "#.maxZoom = #".}

proc `renderOrder=`*(
  options: OlVectorLayerOptions, value: JsObject
) {.importjs: "#.renderOrder = #".}

proc `renderBuffer=`*(
  options: OlVectorLayerOptions, value: float
) {.importjs: "#.renderBuffer = #".}

proc `source=`*(
  options: OlVectorLayerOptions, value: JsObject
) {.importjs: "#.source = #".}

proc `source=`*(
  options: OlVectorLayerOptions, value: RootRef
) {.importjs: "#.source = #".}

proc `map=`*(options: OlVectorLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `declutter=`*(
  options: OlVectorLayerOptions, value: bool
) {.importjs: "#.declutter = #".}

proc `declutter=`*(
  options: OlVectorLayerOptions, value: float
) {.importjs: "#.declutter = #".}

proc `declutter=`*(
  options: OlVectorLayerOptions, value: cstring
) {.importjs: "#.declutter = #".}

proc `style=`*(
  options: OlVectorLayerOptions, value: JsObject
) {.importjs: "#.style = #".}

proc `background=`*(
  options: OlVectorLayerOptions, value: JsObject
) {.importjs: "#.background = #".}

proc `background=`*(
  options: OlVectorLayerOptions, value: cstring
) {.importjs: "#.background = #".}

proc `updateWhileAnimating=`*(
  options: OlVectorLayerOptions, value: bool
) {.importjs: "#.updateWhileAnimating = #".}

proc `updateWhileInteracting=`*(
  options: OlVectorLayerOptions, value: bool
) {.importjs: "#.updateWhileInteracting = #".}

proc `properties=`*(
  options: OlVectorLayerOptions, value: JsObject
) {.importjs: "#.properties = #".}

proc newOlVectorLayer*(
  options: JsObject = jsUndefined
): OlVectorLayer {.importjs: "(new olNs_layer_Vector.default(#))".}

proc newOlVectorLayer*(
  options: OlVectorLayerOptions
): OlVectorLayer {.importjs: "(new olNs_layer_Vector.default(#))".}
