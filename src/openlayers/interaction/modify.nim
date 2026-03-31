import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Modify from 'ol/interaction/Modify.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Modify)".}

type Modify* = ref object of JsRoot
proc newModify*(
  options: JsObject
): Modify {.importjs: "(new olNs_interaction_Modify.default(#))".}

proc setTrace*(self: Modify, trace: JsObject) {.importjs: "#.setTrace(#)".}
proc getOverlay*(self: Modify): JsObject {.importjs: "#.getOverlay()".}
proc externalAddFeatureHandler*(
  self: Modify, feature: JsObject
) {.importjs: "#.externalAddFeatureHandler_(#)".}

proc externalRemoveFeatureHandler*(
  self: Modify, feature: JsObject
) {.importjs: "#.externalRemoveFeatureHandler_(#)".}

proc getTraceCandidates*(
  self: Modify, event: JsObject
): JsObject {.importjs: "#.getTraceCandidates_(#)".}

proc updateGeometry*(
  self: Modify, vertex: JsObject, dragSegment: JsObject
) {.importjs: "#.updateGeometry_(#, #)".}

proc getPoint*(self: Modify): JsObject {.importjs: "#.getPoint()".}
proc canRemovePoint*(self: Modify): bool {.importjs: "#.canRemovePoint()".}
proc removePoint*(
  self: Modify, coordinate: JsObject = jsUndefined
): bool {.importjs: "#.removePoint(#)".}

proc canInsertPoint*(self: Modify): bool {.importjs: "#.canInsertPoint()".}
proc insertPoint*(
  self: Modify, coordinate: JsObject = jsUndefined
): bool {.importjs: "#.insertPoint(#)".}

type ModifyOptions* = ref object of JsRoot

proc newModifyOptions*(): ModifyOptions {.importjs: "({})".}
proc `condition=`*(
  options: ModifyOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: ModifyOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `deleteCondition=`*(
  options: ModifyOptions, value: JsObject
) {.importjs: "#.deleteCondition = #".}

proc `deleteCondition=`*(
  options: ModifyOptions, value: RootRef
) {.importjs: "#.deleteCondition = #".}

proc `insertVertexCondition=`*(
  options: ModifyOptions, value: JsObject
) {.importjs: "#.insertVertexCondition = #".}

proc `insertVertexCondition=`*(
  options: ModifyOptions, value: RootRef
) {.importjs: "#.insertVertexCondition = #".}

proc `pixelTolerance=`*(
  options: ModifyOptions, value: float
) {.importjs: "#.pixelTolerance = #".}

proc `style=`*(options: ModifyOptions, value: JsObject) {.importjs: "#.style = #".}
proc `style=`*(options: ModifyOptions, value: RootRef) {.importjs: "#.style = #".}
proc `source=`*(options: ModifyOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: ModifyOptions, value: RootRef) {.importjs: "#.source = #".}
proc `hitDetection=`*(
  options: ModifyOptions, value: bool
) {.importjs: "#.hitDetection = #".}

proc `hitDetection=`*(
  options: ModifyOptions, value: JsObject
) {.importjs: "#.hitDetection = #".}

proc `hitDetection=`*(
  options: ModifyOptions, value: RootRef
) {.importjs: "#.hitDetection = #".}

proc `features=`*(
  options: ModifyOptions, value: JsObject
) {.importjs: "#.features = #".}

proc `features=`*(options: ModifyOptions, value: RootRef) {.importjs: "#.features = #".}
proc `filter=`*(options: ModifyOptions, value: JsObject) {.importjs: "#.filter = #".}
proc `filter=`*(options: ModifyOptions, value: RootRef) {.importjs: "#.filter = #".}
proc `trace=`*(options: ModifyOptions, value: bool) {.importjs: "#.trace = #".}
proc `trace=`*(options: ModifyOptions, value: JsObject) {.importjs: "#.trace = #".}
proc `trace=`*(options: ModifyOptions, value: RootRef) {.importjs: "#.trace = #".}
proc `traceSource=`*(
  options: ModifyOptions, value: JsObject
) {.importjs: "#.traceSource = #".}

proc `traceSource=`*(
  options: ModifyOptions, value: RootRef
) {.importjs: "#.traceSource = #".}

proc `wrapX=`*(options: ModifyOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `snapToPointer=`*(
  options: ModifyOptions, value: bool
) {.importjs: "#.snapToPointer = #".}

proc newModify*(
  options: ModifyOptions
): Modify {.importjs: "(new olNs_interaction_Modify.default(#))".}
