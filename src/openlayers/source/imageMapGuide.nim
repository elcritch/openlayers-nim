import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageMapGuide from 'ol/source/ImageMapGuide.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageMapGuide)".}

type
  ImageMapGuide* = ref object of JsRoot
proc newImageMapGuide*(options: JsObject): ImageMapGuide {.importjs: "(new olNs_source_ImageMapGuide.default(#))".}
proc getParams*(self: ImageMapGuide): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: ImageMapGuide): JsObject {.importjs: "#.getImageLoadFunction()".}
proc setParams*(self: ImageMapGuide, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: ImageMapGuide, params: JsObject) {.importjs: "#.updateParams(#)".}
proc setImageLoadFunction*(self: ImageMapGuide, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
