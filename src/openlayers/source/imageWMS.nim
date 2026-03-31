import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageWMS from 'ol/source/ImageWMS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageWMS)".}

type
  OlImageWMS* = ref object of JsRoot
proc newOlImageWMS*(options: JsObject = jsUndefined): OlImageWMS {.importjs: "(new olNs_source_ImageWMS.default(#))".}
proc getFeatureInfoUrl*(self: OlImageWMS, coordinate: JsObject, resolution: float, projection: JsObject, params: JsObject): cstring {.importjs: "#.getFeatureInfoUrl(#, #, #, #)".}
proc getLegendUrl*(self: OlImageWMS, resolution: JsObject = jsUndefined, params: JsObject = jsUndefined): cstring {.importjs: "#.getLegendUrl(#, #)".}
proc getParams*(self: OlImageWMS): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: OlImageWMS): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: OlImageWMS): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: OlImageWMS, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: OlImageWMS, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: OlImageWMS, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: OlImageWMS, params: JsObject) {.importjs: "#.updateParams(#)".}
