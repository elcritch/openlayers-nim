import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Select from 'ol/interaction/Select.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Select)".}

type
  SelectEvent* = ref object of JsRoot
  SelectOptions* = ref object of JsRoot
  Select* = ref object of JsRoot

proc newSelect*(
  options: JsObject = jsUndefined
): Select {.importjs: "(new olNs_interaction_Select.default(#))".}

proc on*(
  self: Select, typeVal: cstring, listener: JsObject
): JsObject {.importjs: "#.on(#, #)".}

proc on*(
  self: Select, typeVal: cstring, listener: RootRef
): JsObject {.importjs: "#.on(#, #)".}

proc on*(
  self: Select, typeVal: cstring, listener: proc(event: JsObject)
): JsObject {.importjs: "#.on(#, #)".}

proc on*(
  self: Select, typeVal: cstring, listener: proc(event: SelectEvent)
): JsObject {.importjs: "#.on(#, #)".}

proc once*(
  self: Select, typeVal: cstring, listener: JsObject
): JsObject {.importjs: "#.once(#, #)".}

proc once*(
  self: Select, typeVal: cstring, listener: RootRef
): JsObject {.importjs: "#.once(#, #)".}

proc once*(
  self: Select, typeVal: cstring, listener: proc(event: JsObject)
): JsObject {.importjs: "#.once(#, #)".}

proc once*(
  self: Select, typeVal: cstring, listener: proc(event: SelectEvent)
): JsObject {.importjs: "#.once(#, #)".}

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

proc newSelectOptions*(): SelectOptions {.importjs: "({})".}
proc `addCondition=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.addCondition = #".}

proc `addCondition=`*(
  options: SelectOptions, value: RootRef
) {.importjs: "#.addCondition = #".}

proc `condition=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: SelectOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: SelectOptions, value: proc(mapBrowserEvent: JsObject): bool
) {.importjs: "#.condition = #".}

proc `layers=`*(options: SelectOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `layers=`*(options: SelectOptions, value: RootRef) {.importjs: "#.layers = #".}
proc `layers=`*[T](options: SelectOptions, value: seq[T]) {.importjs: "#.layers = #".}
proc `style=`*(options: SelectOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: SelectOptions, value: RootRef) {.importjs: "#.style = #".}
proc `style=`*(
  options: SelectOptions, value: proc(feature: JsObject): JsObject
) {.importjs: "#.style = #".}

proc `style=`*(
  options: SelectOptions, value: proc(feature: JsObject, resolution: float): JsObject
) {.importjs: "#.style = #".}

proc `removeCondition=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.removeCondition = #".}

proc `removeCondition=`*(
  options: SelectOptions, value: RootRef
) {.importjs: "#.removeCondition = #".}

proc `toggleCondition=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.toggleCondition = #".}

proc `toggleCondition=`*(
  options: SelectOptions, value: RootRef
) {.importjs: "#.toggleCondition = #".}

proc `toggleCondition=`*(
  options: SelectOptions, value: proc(mapBrowserEvent: JsObject): bool
) {.importjs: "#.toggleCondition = #".}

proc `multi=`*(options: SelectOptions, value: bool) {.importjs: "#.multi = #".}
proc `features=`*(
  options: SelectOptions, value: JsObject
) {.importjs: "#.features = #".}

proc `features=`*(options: SelectOptions, value: RootRef) {.importjs: "#.features = #".}
proc `filter=`*(options: SelectOptions, value: JsObject) {.importjs: "#.filter = #".}
proc `filter=`*(options: SelectOptions, value: RootRef) {.importjs: "#.filter = #".}
proc `hitTolerance=`*(
  options: SelectOptions, value: float
) {.importjs: "#.hitTolerance = #".}

proc selected*(event: SelectEvent): seq[JsObject] {.importjs: "#.selected".}
proc deselected*(event: SelectEvent): seq[JsObject] {.importjs: "#.deselected".}
proc targetSelect*(event: SelectEvent): Select {.importjs: "#.target".}

proc newSelect*(
  options: SelectOptions
): Select {.importjs: "(new olNs_interaction_Select.default(#))".}
