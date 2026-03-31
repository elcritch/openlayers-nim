import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Select from 'ol/interaction/Select.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Select)".}

type
  OlSelectOptions* = ref object of JsRoot
  OlSelect* = ref object of JsRoot

proc newOlSelectOptions*(): OlSelectOptions {.importjs: "({})".}
proc `addCondition=`*(
  options: OlSelectOptions, value: JsObject
) {.importjs: "#.addCondition = #".}

proc `condition=`*(
  options: OlSelectOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `layers=`*(options: OlSelectOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `style=`*(options: OlSelectOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: OlSelectOptions, value: RootRef) {.importjs: "#.style = #".}
proc `removeCondition=`*(
  options: OlSelectOptions, value: JsObject
) {.importjs: "#.removeCondition = #".}

proc `toggleCondition=`*(
  options: OlSelectOptions, value: JsObject
) {.importjs: "#.toggleCondition = #".}

proc `multi=`*(options: OlSelectOptions, value: bool) {.importjs: "#.multi = #".}
proc `features=`*(
  options: OlSelectOptions, value: JsObject
) {.importjs: "#.features = #".}

proc `filter=`*(options: OlSelectOptions, value: JsObject) {.importjs: "#.filter = #".}
proc `hitTolerance=`*(
  options: OlSelectOptions, value: float
) {.importjs: "#.hitTolerance = #".}

proc newOlSelect*(
  options: JsObject = jsUndefined
): OlSelect {.importjs: "(new olNs_interaction_Select.default(#))".}

proc newOlSelect*(
  options: OlSelectOptions
): OlSelect {.importjs: "(new olNs_interaction_Select.default(#))".}

proc getFeatures*(self: OlSelect): JsObject {.importjs: "#.getFeatures()".}
proc getHitTolerance*(self: OlSelect): float {.importjs: "#.getHitTolerance()".}
proc getLayer*(
  self: OlSelect, feature: JsObject
): JsObject {.importjs: "#.getLayer(#)".}

proc setHitTolerance*(
  self: OlSelect, hitTolerance: float
) {.importjs: "#.setHitTolerance(#)".}

proc getStyle*(self: OlSelect): JsObject {.importjs: "#.getStyle()".}
proc selectFeature*(
  self: OlSelect, feature: JsObject
): bool {.importjs: "#.selectFeature(#)".}

proc deselectFeature*(
  self: OlSelect, feature: JsObject
): bool {.importjs: "#.deselectFeature(#)".}

proc toggleFeature*(
  self: OlSelect, feature: JsObject
) {.importjs: "#.toggleFeature(#)".}

proc clearSelection*(self: OlSelect) {.importjs: "#.clearSelection()".}
