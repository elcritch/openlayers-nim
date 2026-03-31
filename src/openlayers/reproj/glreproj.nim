import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_reproj_glreproj from 'ol/reproj/glreproj.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_reproj_glreproj)".}

proc createCanvasContextWebGL*(width: JsObject = jsUndefined, height: JsObject = jsUndefined, canvasPool: JsObject = jsUndefined, settings: JsObject = jsUndefined): JsObject {.importjs: "olNs_reproj_glreproj.createCanvasContextWebGL(#, #, #, #)".}
proc releaseGLCanvas*(gl: JsObject) {.importjs: "olNs_reproj_glreproj.releaseGLCanvas(#)".}
proc render*(gl: JsObject, width: float, height: float, pixelRatio: float, sourceResolution: float, targetResolution: float, targetExtent: JsObject, triangulation: JsObject, sources: JsObject, gutter: float, dataType: float, renderEdges: JsObject = jsUndefined, interpolate: JsObject = jsUndefined, drawSingle: JsObject = jsUndefined): JsObject {.importjs: "olNs_reproj_glreproj.render(#, #, #, #, #, #, #, #, #, #, #, #, #, #)".}

proc getCanvasGLPool*(): JsObject {.importjs: "(olNs_reproj_glreproj.canvasGLPool)".}
