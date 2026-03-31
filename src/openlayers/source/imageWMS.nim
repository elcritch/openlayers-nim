import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageWMS from 'ol/source/ImageWMS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageWMS)".}

type
  ImageWMS* = ref object of JsRoot
proc newImageWMS*(options: JsObject = jsUndefined): ImageWMS {.importjs: "(new olNs_source_ImageWMS.default(#))".}
proc getFeatureInfoUrl*(self: ImageWMS, coordinate: JsObject, resolution: float, projection: JsObject, params: JsObject): cstring {.importjs: "#.getFeatureInfoUrl(#, #, #, #)".}
proc getLegendUrl*(self: ImageWMS, resolution: JsObject = jsUndefined, params: JsObject = jsUndefined): cstring {.importjs: "#.getLegendUrl(#, #)".}
proc getParams*(self: ImageWMS): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: ImageWMS): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: ImageWMS): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: ImageWMS, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: ImageWMS, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: ImageWMS, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: ImageWMS, params: JsObject) {.importjs: "#.updateParams(#)".}
