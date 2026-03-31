import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OGCMap from 'ol/source/OGCMap.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OGCMap)".}

type
  OGCMap* = ref object of JsRoot
proc newOGCMap*(options: JsObject = jsUndefined): OGCMap {.importjs: "(new olNs_source_OGCMap.default(#))".}
proc getParams*(self: OGCMap): JsObject {.importjs: "#.getParams()".}
proc getImageLoadFunction*(self: OGCMap): JsObject {.importjs: "#.getImageLoadFunction()".}
proc getUrl*(self: OGCMap): cstring {.importjs: "#.getUrl()".}
proc setImageLoadFunction*(self: OGCMap, imageLoadFunction: JsObject) {.importjs: "#.setImageLoadFunction(#)".}
proc setUrl*(self: OGCMap, url: cstring) {.importjs: "#.setUrl(#)".}
proc setParams*(self: OGCMap, params: JsObject) {.importjs: "#.setParams(#)".}
proc updateParams*(self: OGCMap, params: JsObject) {.importjs: "#.updateParams(#)".}
