import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_MouseWheelZoom from 'ol/interaction/MouseWheelZoom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_MouseWheelZoom)".}

type
  OlMouseWheelZoom* = ref object of JsRoot
proc newOlMouseWheelZoom*(options: JsObject = jsUndefined): OlMouseWheelZoom {.importjs: "(new olNs_interaction_MouseWheelZoom.default(#))".}
proc setMouseAnchor*(self: OlMouseWheelZoom, useAnchor: bool) {.importjs: "#.setMouseAnchor(#)".}
