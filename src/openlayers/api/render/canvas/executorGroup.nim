import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_ExecutorGroup from 'ol/render/canvas/ExecutorGroup.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_ExecutorGroup)".}

type
  OlExecutorGroup* = ref object of JsRoot
proc newOlExecutorGroup*(maxExtent: JsObject, resolution: float, pixelRatio: float, overlaps: bool, allInstructions: JsObject, renderBuffer: JsObject = jsUndefined, deferredRendering: JsObject = jsUndefined): OlExecutorGroup {.importjs: "(new olNs_render_canvas_ExecutorGroup.default(#, #, #, #, #, #, #))".}
proc clip*(self: OlExecutorGroup, context: JsObject, transform: JsObject) {.importjs: "#.clip(#, #)".}
proc hasExecutors*(self: OlExecutorGroup, executors: JsObject): bool {.importjs: "#.hasExecutors(#)".}
proc forEachFeatureAtCoordinate*(self: OlExecutorGroup, coordinate: JsObject, resolution: float, rotation: float, hitTolerance: float, callback: JsObject, declutteredFeatures: JsObject): JsObject {.importjs: "#.forEachFeatureAtCoordinate(#, #, #, #, #, #)".}
proc getClipCoords*(self: OlExecutorGroup, transform: JsObject): JsObject {.importjs: "#.getClipCoords(#)".}
proc isEmpty*(self: OlExecutorGroup): bool {.importjs: "#.isEmpty()".}
proc execute*(self: OlExecutorGroup, targetContext: JsObject, scaledCanvasSize: JsObject, transform: JsObject, viewRotation: float, snapToPixel: bool, builderTypes: JsObject = jsUndefined, declutterTree: JsObject = jsUndefined) {.importjs: "#.execute(#, #, #, #, #, #, #)".}
proc getDeferredZIndexContexts*(self: OlExecutorGroup): JsObject {.importjs: "#.getDeferredZIndexContexts()".}
proc getRenderedContext*(self: OlExecutorGroup): JsObject {.importjs: "#.getRenderedContext()".}
proc renderDeferred*(self: OlExecutorGroup) {.importjs: "#.renderDeferred()".}

proc getPixelIndexArray*(radius: float): seq[float] {.importjs: "olNs_render_canvas_ExecutorGroup.getPixelIndexArray(#)".}

proc getALL*(): JsObject {.importjs: "(olNs_render_canvas_ExecutorGroup.ALL)".}
proc getDECLUTTER*(): JsObject {.importjs: "(olNs_render_canvas_ExecutorGroup.DECLUTTER)".}
proc getNON_DECLUTTER*(): JsObject {.importjs: "(olNs_render_canvas_ExecutorGroup.NON_DECLUTTER)".}
