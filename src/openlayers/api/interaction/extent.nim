import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Extent from 'ol/interaction/Extent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Extent)".}

type
  OlExtent* = ref object of JsRoot
proc newOlExtent*(options: JsObject = jsUndefined): OlExtent {.importjs: "(new olNs_interaction_Extent.default(#))".}
proc getExtent*(self: OlExtent): JsObject {.importjs: "#.getExtent()".}
proc getExtentInternal*(self: OlExtent): JsObject {.importjs: "#.getExtentInternal()".}
proc setExtent*(self: OlExtent, extent: JsObject) {.importjs: "#.setExtent(#)".}
