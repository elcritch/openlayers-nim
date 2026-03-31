import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OGCMap from 'ol/source/OGCMap.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OGCMap)".}

type
  OlOGCMap* = ref object of JsRoot
proc newOlOGCMap*(options: JsObject = jsUndefined): OlOGCMap {.importjs: "(new olNs_source_OGCMap.default(#))".}
proc getParams*(self: OlOGCMap): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: OlOGCMap): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: OlOGCMap): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: OlOGCMap, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: OlOGCMap, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: OlOGCMap, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: OlOGCMap, params: JsObject) {.importjs: "#.updateParams(#)".}
