import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageArcGISRest from 'ol/source/ImageArcGISRest.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageArcGISRest)".}

type
  ImageArcGISRest* = ref object of JsRoot
proc newImageArcGISRest*(options: JsObject = jsUndefined): ImageArcGISRest {.importjs: "(new olNs_source_ImageArcGISRest.default(#))".}
proc getParams*(self: ImageArcGISRest): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: ImageArcGISRest): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: ImageArcGISRest): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: ImageArcGISRest, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: ImageArcGISRest, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: ImageArcGISRest, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: ImageArcGISRest, params: JsObject) {.importjs: "#.updateParams(#)".}
