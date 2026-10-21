import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(openlayers.globalBundle):
  {.emit: "var olNs_layer_Image = {default: globalThis.ol?.layer?.Image};".}
elif not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_layer_Image from 'ol/layer/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Image)".}

type ImageLayer* = ref object of JsRoot
proc newImageLayer*(
  options: JsObject = jsUndefined
): ImageLayer {.importjs: "(new olNs_layer_Image.default(#))".}

type ImageLayerOptions* = ref object of JsRoot

proc newImageLayerOptions*(): ImageLayerOptions {.importjs: "({})".}
proc `opacity=`*(options: ImageLayerOptions, value: float) {.importjs: "#.opacity = #".}
proc `className=`*(
  options: ImageLayerOptions, value: cstring
) {.importjs: "#.className = #".}

proc `visible=`*(options: ImageLayerOptions, value: bool) {.importjs: "#.visible = #".}
proc `source=`*(options: ImageLayerOptions, value: RootRef) {.importjs: "#.source = #".}
proc newImageLayer*(
  options: ImageLayerOptions
): ImageLayer {.importjs: "new olNs_layer_Image.default(#)".}
