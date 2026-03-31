import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_VectorContext from 'ol/render/VectorContext.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_VectorContext)".}

type
  OlVectorContext* = ref object of JsRoot
proc newOlVectorContext*(): OlVectorContext {.importjs: "(new olNs_render_VectorContext.default())".}
proc drawCustom*(self: OlVectorContext, geometry: JsObject, feature: JsObject, renderer: JsObject, hitDetectionRenderer: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawCustom(#, #, #, #, #)".}
proc drawGeometry*(self: OlVectorContext, geometry: JsObject) {.importjs: "#.drawGeometry(#)".}
proc setStyle*(self: OlVectorContext, style: JsObject) {.importjs: "#.setStyle(#)".}
proc drawCircle*(self: OlVectorContext, circleGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawCircle(#, #, #)".}
proc drawFeature*(self: OlVectorContext, feature: JsObject, style: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawFeature(#, #, #)".}
proc drawGeometryCollection*(self: OlVectorContext, geometryCollectionGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawGeometryCollection(#, #, #)".}
proc drawLineString*(self: OlVectorContext, lineStringGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawLineString(#, #, #)".}
proc drawMultiLineString*(self: OlVectorContext, multiLineStringGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawMultiLineString(#, #, #)".}
proc drawMultiPoint*(self: OlVectorContext, multiPointGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawMultiPoint(#, #, #)".}
proc drawMultiPolygon*(self: OlVectorContext, multiPolygonGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawMultiPolygon(#, #, #)".}
proc drawPoint*(self: OlVectorContext, pointGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawPoint(#, #, #)".}
proc drawPolygon*(self: OlVectorContext, polygonGeometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawPolygon(#, #, #)".}
proc drawText*(self: OlVectorContext, geometry: JsObject, feature: JsObject, index: JsObject = jsUndefined) {.importjs: "#.drawText(#, #, #)".}
proc setFillStrokeStyle*(self: OlVectorContext, fillStyle: JsObject, strokeStyle: JsObject) {.importjs: "#.setFillStrokeStyle(#, #)".}
proc setImageStyle*(self: OlVectorContext, imageStyle: JsObject, declutterImageWithText: JsObject = jsUndefined) {.importjs: "#.setImageStyle(#, #)".}
proc setTextStyle*(self: OlVectorContext, textStyle: JsObject, declutterImageWithText: JsObject = jsUndefined) {.importjs: "#.setTextStyle(#, #)".}
