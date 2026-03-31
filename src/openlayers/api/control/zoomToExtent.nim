import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_ZoomToExtent from 'ol/control/ZoomToExtent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_ZoomToExtent)".}

type
  OlZoomToExtent* = ref object of JsRoot
proc newOlZoomToExtent*(options: JsObject = jsUndefined): OlZoomToExtent {.importjs: "(new olNs_control_ZoomToExtent.default(#))".}
proc handleZoomToExtent*(self: OlZoomToExtent) {.importjs: "#.handleZoomToExtent()".}
