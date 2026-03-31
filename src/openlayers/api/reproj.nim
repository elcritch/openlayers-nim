import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_reproj from 'ol/reproj.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_reproj)".}

proc calculateSourceResolution*(sourceProj: JsObject, targetProj: JsObject, targetCenter: JsObject, targetResolution: float): float {.importjs: "olNs_reproj.calculateSourceResolution(#, #, #, #)".}
proc calculateSourceExtentResolution*(sourceProj: JsObject, targetProj: JsObject, targetExtent: JsObject, targetResolution: float): float {.importjs: "olNs_reproj.calculateSourceExtentResolution(#, #, #, #)".}
proc render*(width: float, height: float, pixelRatio: float, sourceResolution: float, sourceExtent: JsObject, targetResolution: float, targetExtent: JsObject, triangulation: JsObject, sources: JsObject, gutter: float, renderEdges: JsObject = jsUndefined, interpolate: JsObject = jsUndefined, drawSingle: JsObject = jsUndefined, clipExtent: JsObject = jsUndefined): JsObject {.importjs: "olNs_reproj.render(#, #, #, #, #, #, #, #, #, #, #, #, #, #)".}

proc getCanvasPool*(): JsObject {.importjs: "(olNs_reproj.canvasPool)".}
