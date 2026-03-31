import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ImageStatic from 'ol/source/ImageStatic.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ImageStatic)".}

type
  OlStatic* = ref object of JsRoot
proc newOlStatic*(options: JsObject): OlStatic {.importjs: "(new olNs_source_ImageStatic.default(#))".}
proc getImageExtent*(self: OlStatic): JsObject {.importjs: "#.getImageExtent()".}
proc getUrl*(self: OlStatic): cstring {.importjs: "#.getUrl()".}
