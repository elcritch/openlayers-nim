import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_BaseImage from 'ol/layer/BaseImage.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_BaseImage)".}

type BaseImageLayer* = ref object of JsRoot
proc newBaseImageLayer*(): BaseImageLayer {.
  importjs: "(new olNs_layer_BaseImage.default())"
.}

type BaseImageLayerOptions* = ref object of JsRoot

proc newBaseImageLayerOptions*(): BaseImageLayerOptions {.importjs: "({})".}
proc `className=`*(
  options: BaseImageLayerOptions, value: cstring
) {.importjs: "#.className = #".}

proc `opacity=`*(
  options: BaseImageLayerOptions, value: float
) {.importjs: "#.opacity = #".}

proc `visible=`*(
  options: BaseImageLayerOptions, value: bool
) {.importjs: "#.visible = #".}

proc `extent=`*(
  options: BaseImageLayerOptions, value: JsObject
) {.importjs: "#.extent = #".}

proc `extent=`*(
  options: BaseImageLayerOptions, value: RootRef
) {.importjs: "#.extent = #".}

proc `zIndex=`*(
  options: BaseImageLayerOptions, value: float
) {.importjs: "#.zIndex = #".}

proc `minResolution=`*(
  options: BaseImageLayerOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxResolution=`*(
  options: BaseImageLayerOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `minZoom=`*(
  options: BaseImageLayerOptions, value: float
) {.importjs: "#.minZoom = #".}

proc `maxZoom=`*(
  options: BaseImageLayerOptions, value: float
) {.importjs: "#.maxZoom = #".}

proc `map=`*(options: BaseImageLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: BaseImageLayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `source=`*(
  options: BaseImageLayerOptions, value: JsObject
) {.importjs: "#.source = #".}

proc `source=`*(
  options: BaseImageLayerOptions, value: RootRef
) {.importjs: "#.source = #".}

proc `properties=`*(
  options: BaseImageLayerOptions, value: JsObject
) {.importjs: "#.properties = #".}

proc `properties=`*(
  options: BaseImageLayerOptions, value: RootRef
) {.importjs: "#.properties = #".}

proc newBaseImageLayer*(
  options: BaseImageLayerOptions
): BaseImageLayer {.importjs: "(new olNs_layer_BaseImage.default(#))".}
