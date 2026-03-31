import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Modify from 'ol/interaction/Modify.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Modify)".}

type
  OlModify* = ref object of JsRoot
proc newOlModify*(options: JsObject): OlModify {.importjs: "(new olNs_interaction_Modify.default(#))".}
proc setTrace*(self: OlModify, trace: JsObject) {.importjs: "#.setTrace(#)".}
proc getOverlay*(self: OlModify): JsObject {.importjs: "#.getOverlay()".}
proc externalAddFeatureHandler*(self: OlModify, feature: JsObject) {.importjs: "#.externalAddFeatureHandler_(#)".}
proc externalRemoveFeatureHandler*(self: OlModify, feature: JsObject) {.importjs: "#.externalRemoveFeatureHandler_(#)".}
proc getTraceCandidates*(self: OlModify, event: JsObject): JsObject {.importjs: "#.getTraceCandidates_(#)".}
proc updateGeometry*(self: OlModify, vertex: JsObject, dragSegment: JsObject) {.importjs: "#.updateGeometry_(#, #)".}
proc getPoint*(self: OlModify): JsObject {.importjs: "#.getPoint()".}
proc canRemovePoint*(self: OlModify): bool {.importjs: "#.canRemovePoint()".}
proc removePoint*(self: OlModify, coordinate: JsObject = jsUndefined): bool {.importjs: "#.removePoint(#)".}
proc canInsertPoint*(self: OlModify): bool {.importjs: "#.canInsertPoint()".}
proc insertPoint*(self: OlModify, coordinate: JsObject = jsUndefined): bool {.importjs: "#.insertPoint(#)".}
