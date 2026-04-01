import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_render_VectorContext from 'ol/render/VectorContext.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_VectorContext)".}

type
  VectorContext* = ref object of JsRoot
proc newVectorContext*(): VectorContext {.importjs: "(new olNs_render_VectorContext.default())".}
proc drawCustom*(self: VectorContext, geometry: JsObject, feature: JsObject, renderer: JsObject, hitDetectionRenderer: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawCustom(#, #, #, #, #)".}
proc drawGeometry*(self: VectorContext, geometry: JsObject) {.importjs: "#.drawGeometry(#)".}
proc setStyle*(self: VectorContext, style: JsObject) {.importjs: "#.setStyle(#)".}
proc drawCircle*(self: VectorContext, circleGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawCircle(#, #, #)".}
proc drawFeature*(self: VectorContext, feature: JsObject, style: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawFeature(#, #, #)".}
proc drawGeometryCollection*(self: VectorContext, geometryCollectionGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawGeometryCollection(#, #, #)".}
proc drawLineString*(self: VectorContext, lineStringGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawLineString(#, #, #)".}
proc drawMultiLineString*(self: VectorContext, multiLineStringGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawMultiLineString(#, #, #)".}
proc drawMultiPoint*(self: VectorContext, multiPointGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawMultiPoint(#, #, #)".}
proc drawMultiPolygon*(self: VectorContext, multiPolygonGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawMultiPolygon(#, #, #)".}
proc drawPoint*(self: VectorContext, pointGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawPoint(#, #, #)".}
proc drawPolygon*(self: VectorContext, polygonGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawPolygon(#, #, #)".}
proc drawText*(self: VectorContext, geometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawText(#, #, #)".}
proc setFillStrokeStyle*(self: VectorContext, fillStyle: JsObject, strokeStyle: JsObject) {.importjs: "#.setFillStrokeStyle(#, #)".}
proc setImageStyle*(self: VectorContext, imageStyle: JsObject, declutterImageWithText: JsObject = jsUndefined) {.importjs: "#.setImageStyle(#, #)".}
proc setTextStyle*(self: VectorContext, textStyle: JsObject, declutterImageWithText: JsObject = jsUndefined) {.importjs: "#.setTextStyle(#, #)".}
