import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Select from 'ol/interaction/Select.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Select)".}

type
  SelectOptions* = ref object of JsRoot
  Select* = ref object of JsRoot

proc newSelectOptions*(): SelectOptions {.importjs: "({})".}
proc `addCondition=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.addCondition = #".}

proc `condition=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `layers=`*(options: SelectOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `style=`*(options: SelectOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: SelectOptions, value: RootRef) {.importjs: "#.style = #".}
proc `removeCondition=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.removeCondition = #".}

proc `toggleCondition=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.toggleCondition = #".}

proc `multi=`*(options: SelectOptions, value: bool) {.importjs: "#.multi = #".}
proc `features=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.features = #".}

proc `filter=`*(options: SelectOptions, value: JsObject) {.importjs: "#.filter = #".}
proc `hitTolerance=`*(
  options: SelectOptions, value: float
) {.importjs: "#.hitTolerance = #".}

proc newSelect*(
  options: JsObject = jsUndefined
): Select {.importjs: "(new olNs_interaction_Select.default(#))".}

proc newSelect*(
  options: SelectOptions
): Select {.importjs: "(new olNs_interaction_Select.default(#))".}

proc getFeatures*(self: Select): JsObject {.importjs: "#.getFeatures()".}
proc getHitTolerance*(self: Select): float {.importjs: "#.getHitTolerance()".}
proc getLayer*(self: Select, feature: JsObject): JsObject {.importjs: "#.getLayer(#)".}

proc setHitTolerance*(
  self: Select, hitTolerance: float
) {.importjs: "#.setHitTolerance(#)".}

proc getStyle*(self: Select): JsObject {.importjs: "#.getStyle()".}
proc selectFeature*(
  self: Select, feature: JsObject
): bool {.importjs: "#.selectFeature(#)".}

proc deselectFeature*(
  self: Select, feature: JsObject
): bool {.importjs: "#.deselectFeature(#)".}

proc toggleFeature*(self: Select, feature: JsObject) {.importjs: "#.toggleFeature(#)".}

proc clearSelection*(self: Select) {.importjs: "#.clearSelection()".}
