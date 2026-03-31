import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageMapGuide from 'ol/source/ImageMapGuide.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageMapGuide)".}

type
  OlImageMapGuide* = ref object of JsRoot
proc newOlImageMapGuide*(options: JsObject): OlImageMapGuide {.importjs: "(new olNs_source_ImageMapGuide.default(#))".}
proc getParams*(self: OlImageMapGuide): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: OlImageMapGuide): JsObject {.importjs: "#.getImageLoadFunction()".}
proc setParams*(self: OlImageMapGuide, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: OlImageMapGuide, params: JsObject) {.importjs: "#.updateParams(#)".}
proc setImageLoadFunction*(self: OlImageMapGuide, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
