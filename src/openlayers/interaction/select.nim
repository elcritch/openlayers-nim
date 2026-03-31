import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Select from 'ol/interaction/Select.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Select)".}

type
  OlSelect* = ref object of JsRoot
proc newOlSelect*(options: JsObject = jsUndefined): OlSelect {.importjs: "(new olNs_interaction_Select.default(#))".}
proc getFeatures*(self: OlSelect): JsObject {.importjs: "#.getFeatures()".}
proc getHitTolerance*(self: OlSelect): float {.importjs: "#.getHitTolerance()".}
proc getLayer*(self: OlSelect, feature: JsObject): JsObject {.importjs: "#.getLayer(#)".}
proc setHitTolerance*(self: OlSelect, hitTolerance: float) {.importjs: "#.setHitTolerance(#)".}
proc getStyle*(self: OlSelect): JsObject {.importjs: "#.getStyle()".}
proc selectFeature*(self: OlSelect, feature: JsObject): bool {.importjs: "#.selectFeature(#)".}
proc deselectFeature*(self: OlSelect, feature: JsObject): bool {.importjs: "#.deselectFeature(#)".}
proc toggleFeature*(self: OlSelect, feature: JsObject) {.importjs: "#.toggleFeature(#)".}
proc clearSelection*(self: OlSelect) {.importjs: "#.clearSelection()".}
