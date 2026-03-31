import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageStatic from 'ol/source/ImageStatic.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageStatic)".}

type
  Static* = ref object of JsRoot
proc newStatic*(options: JsObject): Static {.importjs: "(new olNs_source_ImageStatic.default(#))".}
proc getImageExtent*(self: Static): JsObject {.importjs: "#.getImageExtent()".}
proc getUrl*(self: Static): cstring {.importjs: "#.getUrl()".}
