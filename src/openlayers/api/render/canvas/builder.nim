import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_Builder from 'ol/render/canvas/Builder.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_Builder)".}

type
  OlCanvasBuilder* = ref object of JsRoot
proc newOlCanvasBuilder*(tolerance: float, maxExtent: JsObject, resolution: float, pixelRatio: float): OlCanvasBuilder {.importjs: "(new olNs_render_canvas_Builder.default(#, #, #, #))".}
proc applyPixelRatio*(self: OlCanvasBuilder, dashArray: seq[float]): seq[float] {.importjs: "#.applyPixelRatio(#)".}
proc appendFlatPointCoordinates*(self: OlCanvasBuilder, flatCoordinates: seq[float], stride: float): float {.importjs: "#.appendFlatPointCoordinates(#, #)".}
proc appendFlatLineCoordinates*(self: OlCanvasBuilder, flatCoordinates: seq[float], offset: float, endVal: float, stride: float, closed: bool, skipFirst: bool): float {.importjs: "#.appendFlatLineCoordinates(#, #, #, #, #, #)".}
proc drawCustomCoordinates*(self: OlCanvasBuilder, flatCoordinates: seq[float], offset: float, ends: seq[float], stride: float, builderEnds: seq[float]): float {.importjs: "#.drawCustomCoordinates_(#, #, #, #, #)".}
proc beginGeometry*(self: OlCanvasBuilder, geometry: JsObject, feature: JsObject, index: float) {.importjs: "#.beginGeometry(#, #, #)".}
proc finish*(self: OlCanvasBuilder): JsObject {.importjs: "#.finish()".}
proc reverseHitDetectionInstructions*(self: OlCanvasBuilder) {.importjs: "#.reverseHitDetectionInstructions()".}
proc fillStyleToState*(self: OlCanvasBuilder, fillStyle: JsObject, state: JsObject = jsUndefined): JsObject {.importjs: "#.fillStyleToState(#, #)".}
proc strokeStyleToState*(self: OlCanvasBuilder, strokeStyle: JsObject, state: JsObject = jsUndefined): JsObject {.importjs: "#.strokeStyleToState(#, #)".}
proc createFill*(self: OlCanvasBuilder, state: JsObject): JsObject {.importjs: "#.createFill(#)".}
proc applyStroke*(self: OlCanvasBuilder, state: JsObject) {.importjs: "#.applyStroke(#)".}
proc createStroke*(self: OlCanvasBuilder, state: JsObject): JsObject {.importjs: "#.createStroke(#)".}
proc updateFillStyle*(self: OlCanvasBuilder, state: JsObject, createFill: JsObject) {.importjs: "#.updateFillStyle(#, #)".}
proc updateStrokeStyle*(self: OlCanvasBuilder, state: JsObject, applyStroke: JsObject) {.importjs: "#.updateStrokeStyle(#, #)".}
proc endGeometry*(self: OlCanvasBuilder, feature: JsObject) {.importjs: "#.endGeometry(#)".}
proc getBufferedMaxExtent*(self: OlCanvasBuilder): JsObject {.importjs: "#.getBufferedMaxExtent()".}
