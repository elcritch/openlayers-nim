import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Modify from 'ol/interaction/Modify.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Modify)".}

type
  Modify* = ref object of JsRoot
proc newModify*(options: JsObject): Modify {.importjs: "(new olNs_interaction_Modify.default(#))".}
proc setTrace*(self: Modify, trace: JsObject) {.importjs: "#.setTrace(#)".}
proc getOverlay*(self: Modify): JsObject {.importjs: "#.getOverlay()".}
proc externalAddFeatureHandler*(self: Modify, feature: JsObject) {.importjs: "#.externalAddFeatureHandler_(#)".}
proc externalRemoveFeatureHandler*(self: Modify, feature: JsObject) {.importjs: "#.externalRemoveFeatureHandler_(#)".}
proc getTraceCandidates*(self: Modify, event: JsObject): JsObject {.importjs: "#.getTraceCandidates_(#)".}
proc updateGeometry*(self: Modify, vertex: JsObject, dragSegment: JsObject) {.importjs: "#.updateGeometry_(#, #)".}
proc getPoint*(self: Modify): JsObject {.importjs: "#.getPoint()".}
proc canRemovePoint*(self: Modify): bool {.importjs: "#.canRemovePoint()".}
proc removePoint*(self: Modify, coordinate: JsObject = jsUndefined): bool {.importjs: "#.removePoint(#)".}
proc canInsertPoint*(self: Modify): bool {.importjs: "#.canInsertPoint()".}
proc insertPoint*(self: Modify, coordinate: JsObject = jsUndefined): bool {.importjs: "#.insertPoint(#)".}
