import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_MousePosition from 'ol/control/MousePosition.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_MousePosition)".}

type
  MousePosition* = ref object of JsRoot
proc newMousePosition*(options: JsObject = jsUndefined): MousePosition {.importjs: "(new olNs_control_MousePosition.default(#))".}
proc getCoordinateFormat*(self: MousePosition): JsObject {.importjs: "#.getCoordinateFormat()".}
proc getProjection*(self: MousePosition): JsObject {.importjs: "#.getProjection()".}
proc handleMouseMove*(self: MousePosition, event: JsObject) {.importjs: "#.handleMouseMove(#)".}
proc handleMouseOut*(self: MousePosition, event: JsObject) {.importjs: "#.handleMouseOut(#)".}
proc setCoordinateFormat*(self: MousePosition, format: JsObject) {.importjs: "#.setCoordinateFormat(#)".}
proc setProjection*(self: MousePosition, projection: JsObject) {.importjs: "#.setProjection(#)".}
