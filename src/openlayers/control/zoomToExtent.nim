import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_ZoomToExtent from 'ol/control/ZoomToExtent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_ZoomToExtent)".}

type
  ZoomToExtent* = ref object of JsRoot
proc newZoomToExtent*(options: JsObject = jsUndefined): ZoomToExtent {.importjs: "(new olNs_control_ZoomToExtent.default(#))".}
proc handleZoomToExtent*(self: ZoomToExtent) {.importjs: "#.handleZoomToExtent()".}
