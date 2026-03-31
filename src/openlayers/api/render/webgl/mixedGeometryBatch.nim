import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_webgl_MixedGeometryBatch from 'ol/render/webgl/MixedGeometryBatch.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_webgl_MixedGeometryBatch)".}

type
  OlMixedGeometryBatch* = ref object of JsRoot
proc newOlMixedGeometryBatch*(): OlMixedGeometryBatch {.importjs: "(new olNs_render_webgl_MixedGeometryBatch.default())".}
proc addFeatures*(self: OlMixedGeometryBatch, features: JsObject, projectionTransform: JsObject = jsUndefined) {.importjs: "#.addFeatures(#, #)".}
proc addFeature*(self: OlMixedGeometryBatch, feature: JsObject, projectionTransform: JsObject = jsUndefined) {.importjs: "#.addFeature(#, #)".}
proc changeFeature*(self: OlMixedGeometryBatch, feature: JsObject, projectionTransform: JsObject = jsUndefined) {.importjs: "#.changeFeature(#, #)".}
proc removeFeature*(self: OlMixedGeometryBatch, feature: JsObject) {.importjs: "#.removeFeature(#)".}
proc clear*(self: OlMixedGeometryBatch) {.importjs: "#.clear()".}
proc getFeatureFromRef*(self: OlMixedGeometryBatch, refVal: float): JsObject {.importjs: "#.getFeatureFromRef(#)".}
proc isEmpty*(self: OlMixedGeometryBatch): bool {.importjs: "#.isEmpty()".}
proc filter*(self: OlMixedGeometryBatch, featureFilter: JsObject): JsObject {.importjs: "#.filter(#)".}
