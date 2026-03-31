import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_renderer_Map from 'ol/renderer/Map.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_renderer_Map)".}

type
  OlMapRenderer* = ref object of JsRoot
proc newOlMapRenderer*(map: JsObject): OlMapRenderer {.importjs: "(new olNs_renderer_Map.default(#))".}
proc dispatchRenderEvent*(self: OlMapRenderer, typeVal: JsObject, frameState: JsObject) {.importjs: "#.dispatchRenderEvent(#, #)".}
proc calculateMatrices2D*(self: OlMapRenderer, frameState: JsObject) {.importjs: "#.calculateMatrices2D(#)".}
proc forEachFeatureAtCoordinate*(self: OlMapRenderer, coordinate: JsObject, frameState: JsObject, hitTolerance: float, checkWrapped: bool, callback: JsObject, thisArg: JsObject, layerFilter: JsObject, thisArg2: JsObject): JsObject {.importjs: "#.forEachFeatureAtCoordinate(#, #, #, #, #, #, #, #)".}
proc hasFeatureAtCoordinate*(self: OlMapRenderer, coordinate: JsObject, frameState: JsObject, hitTolerance: float, checkWrapped: bool, layerFilter: JsObject, thisArg: JsObject): bool {.importjs: "#.hasFeatureAtCoordinate(#, #, #, #, #, #)".}
proc getMap*(self: OlMapRenderer): JsObject {.importjs: "#.getMap()".}
proc renderFrame*(self: OlMapRenderer, frameState: JsObject) {.importjs: "#.renderFrame(#)".}
proc scheduleExpireIconCache*(self: OlMapRenderer, frameState: JsObject) {.importjs: "#.scheduleExpireIconCache(#)".}
