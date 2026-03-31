import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_control_MousePosition from 'ol/control/MousePosition.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_MousePosition)".}

type
  OlMousePosition* = ref object of JsRoot
proc newOlMousePosition*(options: JsObject = jsUndefined): OlMousePosition {.importjs: "(new olNs_control_MousePosition.default(#))".}
proc getCoordinateFormat*(self: OlMousePosition): JsObject {.importjs: "#.getCoordinateFormat()".}
proc getProjection*(self: OlMousePosition): JsObject {.importjs: "#.getProjection()".}
proc handleMouseMove*(self: OlMousePosition, event: JsObject) {.importjs: "#.handleMouseMove(#)".}
proc handleMouseOut*(self: OlMousePosition, event: JsObject) {.importjs: "#.handleMouseOut(#)".}
proc setCoordinateFormat*(self: OlMousePosition, format: JsObject) {.importjs: "#.setCoordinateFormat(#)".}
proc setProjection*(self: OlMousePosition, projection: JsObject) {.importjs: "#.setProjection(#)".}
