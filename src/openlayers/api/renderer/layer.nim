import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_Layer from 'ol/renderer/Layer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_Layer)".}

type
  OlLayerRenderer* = ref object of JsRoot
proc newOlLayerRenderer*(layer: JsObject): OlLayerRenderer {.importjs: "(new olNs_renderer_Layer.default(#))".}
proc getStaleKeys*(self: OlLayerRenderer): seq[cstring] {.importjs: "#.getStaleKeys()".}
proc prependStaleKey*(self: OlLayerRenderer, key: cstring) {.importjs: "#.prependStaleKey(#)".}
proc getFeatures*(self: OlLayerRenderer, pixel: JsObject): JsObject {.importjs: "#.getFeatures(#)".}
proc getData*(self: OlLayerRenderer, pixel: JsObject): JsObject {.importjs: "#.getData(#)".}
proc prepareFrame*(self: OlLayerRenderer, frameState: JsObject): bool {.importjs: "#.prepareFrame(#)".}
proc renderFrame*(self: OlLayerRenderer, frameState: JsObject, target: JsObject): JsObject {.importjs: "#.renderFrame(#, #)".}
proc forEachFeatureAtCoordinate*(self: OlLayerRenderer, coordinate: JsObject, frameState: JsObject, hitTolerance: float, callback: JsObject, matches: JsObject): JsObject {.importjs: "#.forEachFeatureAtCoordinate(#, #, #, #, #)".}
proc getLayer*(self: OlLayerRenderer): JsObject {.importjs: "#.getLayer()".}
proc handleFontsChanged*(self: OlLayerRenderer) {.importjs: "#.handleFontsChanged()".}
proc loadImage*(self: OlLayerRenderer, image: JsObject): bool {.importjs: "#.loadImage(#)".}
proc renderIfReadyAndVisible*(self: OlLayerRenderer) {.importjs: "#.renderIfReadyAndVisible()".}
proc renderDeferred*(self: OlLayerRenderer, frameState: JsObject) {.importjs: "#.renderDeferred(#)".}
