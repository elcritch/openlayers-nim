import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control from 'ol/control.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control)".}

proc getAttribution*(): JsObject {.importjs: "(olNs_control.Attribution)".}
proc getControl*(): JsObject {.importjs: "(olNs_control.Control)".}
proc getFullScreen*(): JsObject {.importjs: "(olNs_control.FullScreen)".}
proc getMousePosition*(): JsObject {.importjs: "(olNs_control.MousePosition)".}
proc getOverviewMap*(): JsObject {.importjs: "(olNs_control.OverviewMap)".}
proc getRotate*(): JsObject {.importjs: "(olNs_control.Rotate)".}
proc getScaleLine*(): JsObject {.importjs: "(olNs_control.ScaleLine)".}
proc getZoom*(): JsObject {.importjs: "(olNs_control.Zoom)".}
proc getZoomSlider*(): JsObject {.importjs: "(olNs_control.ZoomSlider)".}
proc getZoomToExtent*(): JsObject {.importjs: "(olNs_control.ZoomToExtent)".}
proc getDefaults*(): JsObject {.importjs: "(olNs_control.defaults)".}
