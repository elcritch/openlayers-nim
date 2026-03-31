import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Extent from 'ol/interaction/Extent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Extent)".}

type
  Extent* = ref object of JsRoot
proc newExtent*(options: JsObject = jsUndefined): Extent {.importjs: "(new olNs_interaction_Extent.default(#))".}
proc getExtent*(self: Extent): JsObject {.importjs: "#.getExtent()".}
proc getExtentInternal*(self: Extent): JsObject {.importjs: "#.getExtentInternal()".}
proc setExtent*(self: Extent, extent: JsObject) {.importjs: "#.setExtent(#)".}
