import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageArcGISRest from 'ol/source/ImageArcGISRest.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageArcGISRest)".}

type
  OlImageArcGISRest* = ref object of JsRoot
proc newOlImageArcGISRest*(options: JsObject = jsUndefined): OlImageArcGISRest {.importjs: "(new olNs_source_ImageArcGISRest.default(#))".}
proc getParams*(self: OlImageArcGISRest): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: OlImageArcGISRest): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: OlImageArcGISRest): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: OlImageArcGISRest, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: OlImageArcGISRest, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: OlImageArcGISRest, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: OlImageArcGISRest, params: JsObject) {.importjs: "#.updateParams(#)".}
